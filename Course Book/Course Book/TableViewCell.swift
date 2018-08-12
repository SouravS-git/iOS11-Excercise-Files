//
//  TableViewCell.swift
//  Course Book
//
//  Created by Sourav Sarkar on 30/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var courseFees: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func fillCouseCell(course: Course) {
        courseName.text = course.coursename
        email.text = course.email
        courseFees.text = "$"+String(course.price)
        courseImage.image = course.courseToimage?.image as! UIImage
        
        //TODO: Set image later
    }
}
