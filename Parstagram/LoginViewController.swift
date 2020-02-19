//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Hung Phan on 2/18/20.
//  Copyright © 2020 Hung Phan. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        
        let usernameL = username.text!
        let passwordL = password.text!
        
        PFUser.logInWithUsername(inBackground: usernameL, password: passwordL) {
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }

        
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = username.text
        user.password = password.text
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
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
