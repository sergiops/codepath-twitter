//
//  LoginViewController.swift
//  Twitter
//
//  Created by Sergio P. on 10/27/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "isLoggedIn") {
            self.performSegue(withIdentifier: "LoginSuccess", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let oauthUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: oauthUrl, success: {
            print("Success!")
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            self.performSegue(withIdentifier: "LoginSuccess", sender: self)
        }, failure: { (Error) in
            print("Failed to login.")
        })
    }
    
}
