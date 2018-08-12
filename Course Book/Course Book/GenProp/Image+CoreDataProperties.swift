//
//  Image+CoreDataProperties.swift
//  Course Book
//
//  Created by Sourav Sarkar on 29/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var imageTocourse: Course?
    @NSManaged public var imageTocategory: Category?

}
