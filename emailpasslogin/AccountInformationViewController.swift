//
//  AccountInformationViewController.swift
//  emailpasslogin
//
//  Created by Franco Rodrigues on 5/9/22.
//

import UIKit

class AccountInformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Account Information
        // Change or Add a new e-mail
        // Change or Add Phone Number
        // Password change
        
        let AccountinfoLabel = UILabel()
        
        AccountinfoLabel.frame = CGRect(x: 5, y: 220, width: 250, height: 50)
        AccountinfoLabel.textAlignment = .left
        AccountinfoLabel.text = "E-mail"
        AccountinfoLabel.textColor = .black
        view.addSubview(AccountinfoLabel)
        
        
        //Help & Feedback
        let HelpFeedback = UILabel()
        HelpFeedback.frame = CGRect(x: 5, y: 260, width: 250, height: 60)
        HelpFeedback.textAlignment = .left
        HelpFeedback.text = "Phone Number"
        HelpFeedback.textColor = .black
        view.addSubview(HelpFeedback)
        
        //Privacy Policy
        let PrivacyPolicy = UILabel()
        PrivacyPolicy.frame = CGRect(x: 5, y: 300, width: 250, height: 60)
        PrivacyPolicy.textAlignment = .left
        PrivacyPolicy.text = "Password"
        PrivacyPolicy.textColor = .black
        view.addSubview(PrivacyPolicy)
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

