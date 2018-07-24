//
//  LoginViewController.swift
//  Finn
//
//  Created by t-sawass on 7/23/18.
//  Copyright © 2018 t-sawass. All rights reserved.
//

import UIKit
import TKSubmitTransition

class LoginViewController: UIViewController, UIViewControllerTransitioningDelegate {

    var btn: TKTransitionSubmitButton!
    @IBOutlet weak var loginBackgroundImage: UIImageView!
    @IBOutlet weak var usernameEntryField: UITextField!
    @IBOutlet weak var passwordEntryField: UITextField!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var accountSignUpText: UILabel!
    @IBOutlet weak var loginButton: TKTransitionSubmitButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        loginButton.animate(1, completion: { () -> () in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
            self.present(homeVC, animated: true, completion: nil)
        })
        
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TKFadeInAnimator(transitionDuration: 0.5, startingAlpha: 0.8)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}
