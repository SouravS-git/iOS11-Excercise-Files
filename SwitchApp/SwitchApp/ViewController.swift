//
//  ViewController.swift
//  SwitchApp
//
//  Created by Sourav Sarkar on 08/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var radioSwitch: UISwitch!
    
    @IBAction func lightsController(_ sender: Any) {
        if(radioSwitch.isOn){
            self.view.backgroundColor = UIColor.white
        }else{
            self.view.backgroundColor = UIColor.gray
        }
    }
}

