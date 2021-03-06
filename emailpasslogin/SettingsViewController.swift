//
//  settingsViewController.swift
//  emailpasslogin
//
//  Created by Franco Rodrigues on 4/30/22.
//

import UIKit

class SettingsViewController: UIViewController, UITextViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initView()
        
        //Account Information
        let AccountinfoLabel = UILabel()
        
        AccountinfoLabel.frame = CGRect(x: 5, y: 220, width: 250, height: 50)
        AccountinfoLabel.textAlignment = .left
        AccountinfoLabel.text = "Account Information"
        AccountinfoLabel.textColor = .black
        view.addSubview(AccountinfoLabel)
        
        
        //Help & Feedback
        let HelpFeedback = UILabel()
        HelpFeedback.frame = CGRect(x: 5, y: 260, width: 250, height: 60)
        HelpFeedback.textAlignment = .left
        HelpFeedback.text = "Help & Feedback"
        HelpFeedback.textColor = .black
        view.addSubview(HelpFeedback)
        
        //Privacy Policy
        let PrivacyPolicy = UILabel()
        PrivacyPolicy.frame = CGRect(x: 5, y: 300, width: 250, height: 60)
        PrivacyPolicy.textAlignment = .left
        PrivacyPolicy.text = "Privacy Policy"
        PrivacyPolicy.textColor = .black
        view.addSubview(PrivacyPolicy)
        view.backgroundColor = .white
        
        
        view.backgroundColor = .white
    }
    
    func initView() {
        
        
        
    }
    
}
