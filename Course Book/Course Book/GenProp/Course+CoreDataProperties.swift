//
//  Course+CoreDataProperties.swift
//  Course Book
//
//  Created by Sourav Sarkar on 29/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var publisheddate: NSDate?
    @NSManaged public var price: Double
    @NSManaged public var email: String?
    @NSManaged public var coursename: String?
    @NSManaged public var courseTocategory: Category?
    @NSManaged public var courseToimage: Image?

}
