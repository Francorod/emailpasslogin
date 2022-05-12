//
//  GooglePlacesManager.swift
//  emailpasslogin
//
//  Created by Franco Rodrigues on 5/2/22.
//

import Foundation
import GooglePlaces
import CoreLocation


final class GooglePlacesManager {
    static let shared = GooglePlacesManager()
    
    private let client = GMSPlacesClient.shared()
    
    private init() {}
    
    enum PlacesError: Error {
        case failedToFind
        case failedToFetch
        case failedToGetCoordinates
    }
    
    public func findPlaces(
        query: String,
        completion: @escaping (Result<[PlaceSummary], Error>) -> Void
    ) {
        let filter = GMSAutocompleteFilter()
        filter.type = .establishment
        client.findAutocompletePredictions(
            fromQuery: query,
            filter: filter,
            sessionToken: nil
        ) { results, error in
            guard let results = results, error == nil else {
                completion(.failure(PlacesError.failedToFind))
                return
            }
            let places: [PlaceSummary] = results.compactMap({
                PlaceSummary(
                    name: $0.attributedFullText.string,
                    identifier: $0.placeID
                )
            })
            completion(.success(places))
        }
    }
    
    public func fetchDetails(
        for place: PlaceSummary,
        completion: @escaping (Result<PlaceDetails, Error>) -> Void
    ) {
        // Specify the place data types to return.
        let fields: GMSPlaceField = GMSPlaceField(rawValue:
                                                    UInt(GMSPlaceField.all.rawValue))
        client.fetchPlace(
            fromPlaceID: place.identifier,
            
            //change this placeFields to geo or name
            placeFields: fields,
            
            sessionToken: nil
        ) { googlePlace, error in
            guard let googlePlaceSafe = googlePlace, error == nil else {
                completion(.failure(PlacesError.failedToFetch))
                return
            }
            
            let coordinate = CLLocationCoordinate2D(
                latitude: googlePlaceSafe.coordinate.latitude,
                longitude: googlePlaceSafe.coordinate.longitude
            )
            
            let details = PlaceDetails(
                placeId: place.identifier,
                name: googlePlaceSafe.name ?? "unnamed",
                address: googlePlaceSafe.formattedAddress ?? "",
                imageMetadata: googlePlaceSafe.photos![0],
                website: googlePlaceSafe.website,
                coordinates: coordinate
            )
            completion(.success(details))
        }
    }
    
    //Place Image
    func loadImage(for photoMetadata: GMSPlacePhotoMetadata, into view: UIImageView) {
        client.loadPlacePhoto(photoMetadata, callback: { (photo, error) -> Void in
            if let error = error {
                // TODO: Handle the error.
                print("Error loading photo metadata: \(error.localizedDescription)")
            } else {
                view.image = photo
            }
        })
    }
}
