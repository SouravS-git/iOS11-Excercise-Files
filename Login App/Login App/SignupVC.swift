//
//  SignupVC.swift
//  Login App
//
//  Created by Sourav Sarkar on 09/08/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignupVC: UIViewController {
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var userEmail: String?, userPassword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupBtn.layer.cornerRadius = 15
    }
    
    @IBAction func userSignup(_ sender: Any) {
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
        
        Auth.auth().createUser(withEmail: self.userEmail!, password: self.userPassword!) { (user, error) in
            if (error != nil) {
                if let myErr = error?.localizedDescription {
                    self.displayPopup(title: "Error", message: myErr)
                    return
                }
            }else {
                Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).setValue(["email" : self.userEmail])
                self.displayPopup(title: "Success", message: "Registration Successful")
            }
        }
    }
    
    @IBAction func showLoginForm(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
    }
    
    func displayPopup(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

