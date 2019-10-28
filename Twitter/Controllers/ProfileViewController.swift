//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Sergio P. on 10/27/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        TwitterAPICaller.client?.logout()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
