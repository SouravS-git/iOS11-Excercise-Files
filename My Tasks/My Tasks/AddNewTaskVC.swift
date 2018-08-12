//
//  AddNewTaskVC.swift
//  My Tasks
//
//  Created by Sourav Sarkar on 27/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class AddNewTaskVC: UIViewController {
    @IBOutlet weak var needSmiley: UISwitch!
    @IBOutlet weak var taskName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTask(_ sender: Any) {
        let guest = UIApplication.shared.delegate as! AppDelegate
        let context = guest.persistentContainer.viewContext
        
        let task = Task(context: context)
        
        if let name = taskName.text {
            task.name = name
        }
        
        task.smiley = needSmiley.isOn
        
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
