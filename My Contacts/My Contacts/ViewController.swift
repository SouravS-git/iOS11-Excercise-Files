//
//  ViewController.swift
//  My Contacts
//
//  Created by Sourav Sarkar on 28/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var contacts: [Contact] = []
    var selectedContact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        
        cell.textLabel?.text = (contacts[indexPath.row]).name
        
        return cell
    }
    
    func fetchData() {
        let guest = UIApplication.shared.delegate as! AppDelegate
        let context = guest.persistentContainer.viewContext
        
        do {
            contacts = try context.fetch(Contact.fetchRequest())
        }catch{
            print("Something Wrong")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "contactDetails":
                let guest = segue.destination as! TableViewController
                guest.contactDetails = selectedContact
            case "showAddContact":
                let guest = segue.destination as! AddContactVC
            default: break
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContact = contacts[indexPath.row]
        performSegue(withIdentifier: "contactDetails", sender: indexPath)
    }
}

