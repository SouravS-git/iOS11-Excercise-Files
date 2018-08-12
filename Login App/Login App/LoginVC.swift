//
//  LoginVC.swift
//  Login App
//
//  Created by Sourav Sarkar on 10/08/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var userEmail: String?, userPassword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius = 15
    }
    
    @IBAction func userLogin(_ sender: Any) {
        if let email = email.text {
            if email.isEmpty == true {
                displayPopup(title: "Alert", message: "Please enter email")
                return
            }else {
                self.userEmail = email
            }
        }
        
        if let password = password.text {
            if password.isEmpty == true {
                displayPopup(title: "Alert", message: "Please enter password")
                return
            }else {
                self.userPassword = password
            }
        }
        
        Auth.auth().signIn(withEmail: self.userEmail!, password: self.userPassword!) { (user, error) in
            if (error != nil) {
                if let myErr = error?.localizedDescription {
                    self.displayPopup(title: "Error", message: myErr)
                    return
                }
            }else {
                //self.displayPopup(title: "Success", message: "Login Successful")
                self.performSegue(withIdentifier: "userDashboardSegue", sender: nil)
            }
        }
    }
    
    @IBAction func showSignupForm(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
    }
    
    func displayPopup(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
