//
//  AddContactVC.swift
//  My Contacts
//
//  Created by Sourav Sarkar on 28/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class AddContactVC: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveContact(_ sender: Any) {
        
        let name = nameText.text
        let phone = phoneText.text
        
        let guest = UIApplication.shared.delegate as! AppDelegate
        let context = guest.persistentContainer.viewContext
        
        let contact = Contact(context: context)
        
        contact.name = name
        contact.phone = phone
        
        guest.saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
