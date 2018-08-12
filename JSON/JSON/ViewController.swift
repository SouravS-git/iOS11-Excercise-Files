//
//  ViewController.swift
//  JSON
//
//  Created by Sourav Sarkar on 06/08/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let myURL = "https://randomuser.me/api"
    
    var firstName: String?
    var city: String?
    var gender: String?
    var phone: String?
    var email: String?
    var version: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(myURL).responseJSON { (response) in
            if response.result.isSuccess {
                let dict = response.value as? Dictionary<String, AnyObject>
                if let dict = dict {
                    if let innerDict = dict["results"] {
                        if let results = innerDict as? NSArray {
                            if let results = results[0] as? Dictionary<String, AnyObject> {
                                if let gender = results["gender"] {
                                    self.gender = gender as? String
                                }
                                
                                if let name = results["name"] as? Dictionary<String, AnyObject> {
                                    if let firstName = name["first"] {
                                        self.firstName = firstName as? String
                                    }
                                }
                                
                                if let location = results["location"] as? Dictionary<String, AnyObject> {
                                    if let city = location["city"] {
                                        self.city = city as? String
                                    }
                                }
                                
                                if let phone = results["phone"] {
                                    self.phone = phone as? String
                                }
                                
                                if let email = results["email"] {
                                    self.email = email as? String
                                }
                            }
                        }
                    }
                    
                    if let info = dict["info"] {
                        if let info = info as? Dictionary<String, AnyObject> {
                            if let version = info["version"] {
                                self.version = version as? String
                            }
                        }
                    }
                }
            }
            
            self.printData()
        }
    }
    
    func printData() {
        print("firstName : "+firstName!)
        print("city : "+city!)
        print("gender : "+gender!)
        print("phone : "+phone!)
        print("email : "+email!)
        print("version : "+version!)
    }
}
