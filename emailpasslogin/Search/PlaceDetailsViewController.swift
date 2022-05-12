//
//  PlaceDetailsViewController.swift
//  emailpasslogin
//
//  Created by Franco Rodrigues on 5/4/22.

import UIKit

class PlaceDetailsViewController: UIViewController {
    
    var details : PlaceDetails?
    
    func setDetails(with details: PlaceDetails) {
        self.details = details
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        guard let placeDetails = details else {
            return
        }
        //Create image view.
        let imgView = UIImageView()
        imgView.frame = CGRect(x: 5, y: 20, width: 380, height: 200)
        view.addSubview(imgView)
        GooglePlacesManager.shared.loadImage(for: placeDetails.imageMetadata, into: imgView)
        
        
        
        //Title Label
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 10, y: 250, width: 380, height: 25)
        titleLabel.textAlignment = .left
        titleLabel.adjustsFontSizeToFitWidth = (20 != 0)
        titleLabel.text = placeDetails.name
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        
        //Address Label
        let addressLabel = UILabel()
        addressLabel.frame = CGRect(x: 10, y: 260, width: 250, height: 75)
        addressLabel.textAlignment = .left
        addressLabel.numberOfLines = 4
        addressLabel.text = placeDetails.address
        addressLabel.textColor = .white
        view.addSubview(addressLabel)
        
        // Webdite address
        let websiteLabel = UITextView()
        websiteLabel.frame = CGRect(x: 10, y: 300, width: 250, height: 25)
        websiteLabel.textAlignment = .left
        websiteLabel.text = placeDetails.website?.absoluteString
        websiteLabel.textColor = .white
        websiteLabel.backgroundColor = view.backgroundColor
        websiteLabel.isEditable = false
        websiteLabel.dataDetectorTypes = .link
        view.addSubview(websiteLabel)
        
    }

}
