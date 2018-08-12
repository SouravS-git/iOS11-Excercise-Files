//
//  ViewController.swift
//  CoffeeApp
//
//  Created by Sourav Sarkar on 21/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showPrice(_ sender: Any) {
        if (textInput.text?.isEmpty)! {
            priceLabel.text = "Price : $0.00"
            errorLabel.textColor = UIColor.black
            view.endEditing(true)
        }else{
            errorLabel.textColor = UIColor.white
            let price = Double(textInput.text!)! * 15.50
            priceLabel.text = "Price : $\(price)"
            view.endEditing(true)
        }
    }
}

