//
//  Course+CoreDataClass.swift
//  Course Book
//
//  Created by Sourav Sarkar on 29/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Course)
public class Course: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        publisheddate = NSDate()
    }
}
