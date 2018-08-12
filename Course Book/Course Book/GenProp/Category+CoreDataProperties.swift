//
//  Category+CoreDataProperties.swift
//  Course Book
//
//  Created by Sourav Sarkar on 29/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var categoryTocourse: Course?
    @NSManaged public var categoryToimage: Image?

}
