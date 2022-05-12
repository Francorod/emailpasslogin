//
//  searchViewController.swift
//  emailpasslogin
//
//  Created by Franco Rodrigues on 4/30/22.
//

import UIKit
import GooglePlaces

class SearchViewController: UIViewController, UISearchResultsUpdating {
    
    //Search Bar on Top
    let searchVC = UISearchController(searchResultsController: ResultsViewController())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Background
        view.backgroundColor = .systemBlue
        //Search bar
        searchVC.searchBar.backgroundColor = .secondarySystemBackground
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //Update result and show the options
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              let resultsVC = searchController.searchResultsController as? ResultsViewController
        else {
            return
        }
        
        resultsVC.delegate = self
        
        GooglePlacesManager.shared.findPlaces(query: query) {
            result in
            switch result {
            case.success(let places):
                DispatchQueue.main.async {
                    resultsVC.update(with: places)
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
//Tapplace module
extension SearchViewController: ResultsViewControllerDelegate {
    func didTapPlace(with place: PlaceSummary) {
        
        searchVC.searchBar.resignFirstResponder()
        searchVC.dismiss(animated: true, completion: nil)

        GooglePlacesManager.shared.fetchDetails(for: place) { [weak self] result in
            switch result {
            case .success(let placeDetails):
                let detailsVc = PlaceDetailsViewController()
                detailsVc.setDetails(with: placeDetails)
                self!.present(detailsVc, animated: true)
                break
            case .failure(let error):
                let alert = UIAlertController(title: "Unable to fetch the place details",
                                              message: "Error: \(error)",
                                              preferredStyle: .alert)
                self!.present(alert, animated: true)
            }
        }
    }
}
