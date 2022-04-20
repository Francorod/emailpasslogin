//
//  ViewController.swift
//  emailpasslogin
//
//  Created by Franco Rodrigues on 4/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.textAlignment = .center
        emailField.text = "Email Address"
        emailField.font = .systemFont(ofSize: 24, weight: .semibold)
        return emailField
    }()
    
    private let passwordField: UITextField = {
        let passField = UITextField()
        passField.textAlignment = .center
        passField.text = "Log In"
        passField.font = .systemFont(ofSize: 24, weight: .semibold)
        return passField
    }()
    
    private let Button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(Button)
    }


}

