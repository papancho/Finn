//
//  LoginViewController.swift
//  Finn
//
//  Created by t-sawass on 7/23/18.
//  Copyright © 2018 t-sawass. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginBackgroundImage: UIImageView!
    
    @IBOutlet weak var usernameEntryField: UITextField!
    
    @IBOutlet weak var passwordEntryField: UITextField!
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var accountSignUpText: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if let username = usernameEntryField.text, username.isEmpty {
            // pressed login without entering username
            return
        }
        
        if let password = passwordEntryField.text, password.isEmpty {
            // pressed login without entering password
            return
        }
        
        // TODO: check for invalid password
        
        
        
        
    }
    
}
