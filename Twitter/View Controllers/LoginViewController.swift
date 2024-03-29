//
//  LoginViewController.swift
//  Twitter
//
//  Created by Jonathon Chenvert on 12/11/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let twitterUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: twitterUrl, success: {
            
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            UserDefaults.standard.set(true, forKey: "screenname")
            print(twitterUrl)
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not login.")
        })
    }
}
