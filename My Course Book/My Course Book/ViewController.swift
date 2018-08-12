//
//  ViewController.swift
//  My Course Book
//
//  Created by Sourav Sarkar on 04/08/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var courseTableView: UITableView!
    
    var fetchedResult: Results<Course>?
    var rowData: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseTableView.delegate = self
        courseTableView.dataSource = self
        fetchCourses()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        courseTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = fetchedResult?.count {
            return count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if let course = fetchedResult?[indexPath.row] {
            cell.textLabel?.text = course.courseName
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowData = (fetchedResult?[indexPath.row])!
        performSegue(withIdentifier: "editCourseSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editCourseSegue" {
            let guest = segue.destination as! AdditionalVC
            guest.existingCourse = rowData
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let obj = (fetchedResult?[indexPath.row])!
        if editingStyle == .delete {
            let realm = try? Realm()
            try? realm?.write {
                realm?.delete(obj)
            }
        }
        
        courseTableView.reloadData()
    }
    
    func fetchCourses() {
        let realm = try? Realm()
        fetchedResult = realm?.objects(Course.self).sorted(byKeyPath: "price", ascending: true)
    }
}

