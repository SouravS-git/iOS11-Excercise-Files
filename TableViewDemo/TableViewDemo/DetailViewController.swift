//
//  DetailViewController.swift
//  TableViewDemo
//
//  Created by Sourav Sarkar on 27/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var dayNameLabel: UILabel!
    
    var dayName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayNameLabel.text = dayName
        // Do any additional setup after loading the view.
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
