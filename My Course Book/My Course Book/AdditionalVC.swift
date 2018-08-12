//
//  AdditionalVC.swift
//  My Course Book
//
//  Created by Sourav Sarkar on 04/08/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit
import RealmSwift

class AdditionalVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var coursePrice: UITextField!
    
    var imagePicker: UIImagePickerController = UIImagePickerController()
    var existingCourse: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        setData()
    }
    
    @IBAction func imagePicker(_ sender: Any) {
        //imagePicker.sourceType = .camera
        //imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        courseImage.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveCourse(_ sender: Any) {
        let courseObject: Course!
        
        if existingCourse == nil {
            courseObject = Course()
            
            if let courseName = courseName.text {
                courseObject.courseName = courseName
            }
            
            if let email = email.text {
                courseObject.email = email
            }
            
            if let price = coursePrice.text {
                courseObject.price = price
            }
            
            if let courseImage = courseImage.image {
                if let imageData = UIImageJPEGRepresentation(courseImage, 0.1) as NSData? {
                    courseObject.courseImageData = imageData
                }
            }
            
            let realm = try? Realm()
            try? realm?.write {
                realm?.add(courseObject)
            }
        }else {
            courseObject = existingCourse
            
            let realm = try? Realm()
            try? realm?.write {
                if let courseName = courseName.text {
                    courseObject.courseName = courseName
                }
                
                if let email = email.text {
                    courseObject.email = email
                }
                
                if let price = coursePrice.text {
                    courseObject.price = price
                }
                
                if let courseImage = courseImage.image {
                    if let imageData = UIImageJPEGRepresentation(courseImage, 0.1) as NSData? {
                        courseObject.courseImageData = imageData
                    }
                }
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteCourse(_ sender: Any) {
        if existingCourse != nil {
            let realm = try? Realm()
            try? realm?.write {
                if let existingCourse = existingCourse {
                    realm?.delete(existingCourse)
                    
                    navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setData() {
        if let existingCourse = existingCourse {
            courseName.text = existingCourse.courseName
            email.text = existingCourse.email
            coursePrice.text = existingCourse.price
            
            if let course_image = existingCourse.courseImageData {
                courseImage.image = UIImage(data: course_image as Data)
            }
        }
    }
}
