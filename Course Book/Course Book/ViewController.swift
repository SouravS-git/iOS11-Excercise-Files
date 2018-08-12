//
//  ViewController.swift
//  Course Book
//
//  Created by Sourav Sarkar on 28/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var controller: NSFetchedResultsController<Course>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //createTestData()
        fetchDataFromCoreData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }

        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionItem = sections[section]
            return sectionItem.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! TableViewCell
        updateCellInfo(tableCell: cell, indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = controller.object(at: indexPath)
        performSegue(withIdentifier: "editCourseSegue", sender: course)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editCourseSegue" {
            if let guest = segue.destination as? AddCourseVC {
                if let course = sender as? Course {
                    guest.existingCourse = course
                }
            }
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            if let index = indexPath {
                tableView.deleteRows(at: [index], with: .fade)
            }
        case .insert:
            if let index = newIndexPath {
                tableView.insertRows(at: [index], with: .fade)
            }
        case .update:
            if let index = indexPath {
                let tableCell = tableView.cellForRow(at: index) as! TableViewCell
                updateCellInfo(tableCell: tableCell, indexPath: index)
            }
        case .move:
            if let index = indexPath {
                tableView.deleteRows(at: [index], with: .fade)
            }
            if let index = newIndexPath {
                tableView.insertRows(at: [index], with: .fade)
            }
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func updateCellInfo(tableCell: TableViewCell, indexPath: IndexPath) {
        let course = controller.object(at: indexPath)
        tableCell.fillCouseCell(course: course)
    }
    
    func fetchDataFromCoreData() {
        let fetchRequest: NSFetchRequest = Course.fetchRequest()
        
        let moneySort = NSSortDescriptor(key: "price", ascending: true)
        fetchRequest.sortDescriptors = [moneySort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do {
            try controller.performFetch()
        }catch {
            let err = error as NSError
            print(err)
        }
        
    }
    
    func createTestData() {
        let course = Course(context: context)
        course.coursename = "iOS with Swift 4"
        course.email = "isourav2018@gmail.com"
        course.price = 80
        
        let course2 = Course(context: context)
        course2.coursename = "Android with Kotlin"
        course2.email = "i.sourav@icloud.com"
        course2.price = 60
        
        appdelGuest.saveContext()
    }
}

