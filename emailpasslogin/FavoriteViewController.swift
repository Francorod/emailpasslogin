//
//  favoriteViewController.swift
//  emailpasslogin
//
//  Created by Franco Rodrigues on 4/30/22.
//

import UIKit

class FavoriteViewController: UIViewController {

    //Shoe list of the Favorites
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nameLabel = UILabel()
        nameLabel.frame = CGRect(x: 5, y: 160, width: 200, height: 25)
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        nameLabel.text = "My Favorites"
        nameLabel.textColor = .black
        view.addSubview(nameLabel)
        
        
        view.backgroundColor = .white
    }
   
}
