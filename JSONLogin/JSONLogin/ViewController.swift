//
//  ViewController.swift
//  JSONLogin
//
//  Created by Sourav Sarkar on 10/08/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        login()
    }
    
    func register() {
        let name = ""
        let email = ""
        let password = ""
        
        let reg_parameters: Dictionary = [
            "email": email,
            "password": password,
            "c_password": password,
            "name": name,
        ]
        
        Alamofire.request("http://localhost/project/public/api/register", method: .post, parameters: reg_parameters, encoding: JSONEncoding.default)
                    .responseJSON { response in
                        print(response)
                }
    }
    
    func login() {
        let email = "test@test.com"
        let password = "test123"
        
        let login_parameters: Dictionary = [
            "email": email,
            "password": password,
        ]
        
        Alamofire.request("http://localhost/project/public/api/login", method: .post, parameters: login_parameters, encoding: JSONEncoding.default).responseJSON{ response in
                let response = response.result.value as? Dictionary<String, AnyObject>
                let response2 = response!["success"] as? Dictionary<String, AnyObject>
                let token = response2!["token"]
            self.getDetails(token! as! String)
        }
    }
    
    func getDetails(_ token:String) {
        let headers: Dictionary = [
            "Accept": "application/json",
            "Authorization": "Bearer "+token,
        ]
        
        Alamofire.request("http://localhost/project/public/api/details", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            print(response)
        }
    }
}

