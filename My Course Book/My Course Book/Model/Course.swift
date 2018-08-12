//
//  Course.swift
//  My Course Book
//
//  Created by Sourav Sarkar on 04/08/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import Foundation
import RealmSwift

class Course: Object {
    @objc dynamic var courseName: String?
    @objc dynamic var email: String?
    @objc dynamic var price: String?
    
    @objc dynamic var courseImageData: NSData?
}
