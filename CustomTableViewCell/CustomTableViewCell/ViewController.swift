//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by Sourav Sarkar on 27/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var images: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 500
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        
        let imageName = images[(indexPath.row)%17]
        
        cell.myImageView.image = UIImage(named: imageName+".jpg")
        cell.myImageLabel.text = "Image Name : "+imageName+".jpg"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newGuest = segue.destination as! NewVC
        newGuest.imageName = sender as! String
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "imageDetailSegue", sender: images[(indexPath.row)%17])
    }
}

