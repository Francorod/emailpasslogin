//
//  PlaceDetails.swift
//  emailpasslogin
//
//  Created by Franco Rodrigues on 5/6/22.
//

import CoreLocation
import GooglePlaces

struct PlaceDetails {
    let placeId: String
    let name: String
    let address: String
    let imageMetadata: GMSPlacePhotoMetadata
    let website: URL?
    let coordinates: CLLocationCoordinate2D
}
