//
//  ViewController.swift
//  Profiler
//
//  Created by Sourav Sarkar on 09/08/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit
import Alamofire

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

class ViewController: UIViewController {
    
    var myURL = "https://randomuser.me/api"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        Alamofire.request(myURL).responseJSON { (response) in
            if response.result.isSuccess {
                if let dict = response.result.value as? Dictionary<String, AnyObject> {
                    if let results = dict["results"] as? NSArray {
                        if let userInfo = results[0] as? Dictionary<String, AnyObject> {
                            if let nameObj = userInfo["name"] as? Dictionary<String, AnyObject> {
                                var first_name: String = "", last_name:String = ""
                                
                                if let firstName = nameObj["first"] {
                                    first_name = firstName as! String
                                }
                                if let lastName = nameObj["last"] {
                                    last_name = lastName as! String
                                }
                                
                                self.userName.text = first_name+" "+last_name
                            }
                            
                            if let locationObj = userInfo["location"] as? Dictionary<String, AnyObject> {
                                var city: String = "", state:String = ""
                                
                                if let userCity = locationObj["city"] {
                                    city = userCity as! String
                                }
                                if let userState = locationObj["state"] {
                                    state = ", "+(userState as! String)
                                }
                                
                                self.userLocation.text = city+state
                            }
                            
                            if let pictureObj = userInfo["picture"] as? Dictionary<String, AnyObject> {
                                if let picture = pictureObj["large"] {
                                    if let userAvatarURL = URL(string: picture as! String) {
                                        if let imageData = NSData(contentsOf: userAvatarURL) {
                                            self.profileImage.image = UIImage(data: imageData as Data)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func fetchNewUser(_ sender: Any) {
        fetchData()
    }
}

