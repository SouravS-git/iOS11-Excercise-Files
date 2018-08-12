//
//  AddCourseVC.swift
//  Course Book
//
//  Created by Sourav Sarkar on 30/07/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit

class AddCourseVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    var categories: [Category] = []
    
    var existingCourse: Course?
    
    override func viewDidLoad() {
        //insertCategories()
        super.viewDidLoad()
        imagePicker.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
        if existingCourse != nil {
            setCourseData(course: existingCourse!)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchDataFromCoreData()
        pickerView.reloadAllComponents()
    }
    
    @IBAction func imagePicker(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = (info[UIImagePickerControllerOriginalImage] as! UIImage)
        courseImage.image = img
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    //Not Mandatory
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].name
    }
    
    @IBAction func saveCourse(_ sender: Any) {
        var course: Course!
        
        let pic = Image(context: context)
        pic.image = courseImage.image
        
        if existingCourse == nil {
            course = Course(context: context)
        } else {
            course = existingCourse
        }
        
        course.courseToimage = pic
        
        course.coursename = courseName.text
        course.email = email.text
        course.price = (price.text! as NSString).doubleValue

        course.courseTocategory = categories[pickerView.selectedRow(inComponent: 0)]
        
        appdelGuest.saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteCourse(_ sender: Any) {
        if existingCourse != nil {
            context.delete(existingCourse!)
            appdelGuest.saveContext()
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func fetchDataFromCoreData() {
        do {
            categories = try context.fetch(Category.fetchRequest())
        }catch{}
    }
    
    func insertCategories() {
        let cat = Category(context: context)
        cat.name = "Development"
        
        let cat2 = Category(context: context)
        cat2.name = "Photography"
        
        let cat3 = Category(context: context)
        cat3.name = "Life Style"
        
        let cat4 = Category(context: context)
        cat4.name = "Fashion"
        
        appdelGuest.saveContext()
    }
    
    func setCourseData(course: Course) {
        courseImage.image = course.courseToimage?.image as? UIImage
        courseName.text = course.coursename
        price.text = "\(course.price)"
        email.text = course.email
        print(course.courseTocategory?.name)
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
