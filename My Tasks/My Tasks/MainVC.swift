//
//  MainVC.swift
//  My Tasks
//
//  Created by Sourav Sarkar on 27/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var taskTableView: UITableView!
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource = self
        //fetchTasks()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = (tasks[indexPath.row]).name
        
        return cell
    }
    
    func fetchTasks() {
        let guest = UIApplication.shared.delegate as! AppDelegate
        let context = guest.persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest())
        }catch{}
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchTasks()
        taskTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let guest = UIApplication.shared.delegate as! AppDelegate
        let context = guest.persistentContainer.viewContext
        
        if editingStyle == .delete{
            let task = tasks[indexPath.row]
            
            context.delete(task)
            guest.saveContext()
            
            fetchTasks()
            taskTableView.reloadData()
        }
    }
}

