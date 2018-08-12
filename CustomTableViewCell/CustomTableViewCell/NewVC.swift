//
//  NewVC.swift
//  CustomTableViewCell
//
//  Created by Sourav Sarkar on 27/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class NewVC: UIViewController {

    @IBOutlet weak var detailImageLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageLabel.text = "Image Name : "+imageName+".jpg"
        detailImageView.image = UIImage(named: imageName+".jpg")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
