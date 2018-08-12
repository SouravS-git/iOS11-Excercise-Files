//
//  ViewController.swift
//  LightsOut
//
//  Created by Sourav Sarkar on 04/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func outTapped(_ sender: Any) {
        self.view.backgroundColor = UIColor.black
    }
    
    @IBAction func inTapped(_ sender: Any) {
        self.view.backgroundColor = UIColor.white
    }
}

