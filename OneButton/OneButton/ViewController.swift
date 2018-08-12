//
//  ViewController.swift
//  OneButton
//
//  Created by Sourav Sarkar on 08/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonState = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var buttonInstance: UIButton!

    @IBAction func lightsControl(_ sender: Any) {
        if buttonState{
            self.view.backgroundColor = UIColor.white
            titleText.textColor = UIColor.black
            buttonInstance.backgroundColor = UIColor.black
            buttonInstance.setTitleColor(UIColor.white, for: .normal)
            buttonInstance.setTitle("Lights Out", for: .normal)
            buttonState = false
        }else{
            self.view.backgroundColor = UIColor.black
            titleText.textColor = UIColor.white
            buttonInstance.backgroundColor = UIColor.white
            buttonInstance.setTitleColor(UIColor.black, for: .normal)
            buttonInstance.setTitle("Lights Up", for: .normal)
            buttonState = true
        }
    }
    
}

