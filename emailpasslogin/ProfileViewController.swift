//  profileViewController.swift
//  emailpasslogin
//  Created by Franco Rodrigues on 4/30/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // Profile
    // Can change Name/LastName
    //Add the Birthday date
    // Save
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nameLabel = UILabel()
        nameLabel.frame = CGRect(x: 0, y: 220, width: 80, height: 50)
        nameLabel.textAlignment = .center
        nameLabel.text = "Name:"
        nameLabel.textColor = .black
        view.addSubview(nameLabel)
        
        let LastnameLabel = UILabel()
        LastnameLabel.frame = CGRect(x: 0, y: 260, width: 110, height: 60)
        LastnameLabel.textAlignment = .center
        LastnameLabel.text = "Last Name:"
        LastnameLabel.textColor = .black
        view.addSubview(LastnameLabel)
        
        let BirthdayLabel = UILabel()
        BirthdayLabel.frame = CGRect(x: 0, y: 300, width: 90, height: 60)
        BirthdayLabel.textAlignment = .center
        BirthdayLabel.text = "Birthday:"
        BirthdayLabel.textColor = .black
        view.addSubview(BirthdayLabel)
        view.backgroundColor = .white
        
        // Save Button
        let button = UIButton()
        button.frame = CGRect(x: 10, y: 360, width: 150, height: 40)
        button.backgroundColor = UIColor.gray
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    
}
