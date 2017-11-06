//
//  NewEateryTableViewController.swift
//  Eateries
//
//  Created by user131656 on 11/4/17.
//  Copyright © 2017 Aleksey Kabishau. All rights reserved.
//

import UIKit

class NewEateryTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var restaurantTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    var isVisited = false
    
    @IBAction func isVisitedButtonsTapped(_ sender: UIButton) {
        if sender == yesButton {
            sender.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            noButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            isVisited = true
        } else {
            sender.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            yesButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            isVisited = false
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        if restaurantTextField.text == "" || addressTextField.text == "" || typeTextField.text == "" {
            print("not all fields are filled in")
        } else {
            // trying to reach viewContext property - standard way to do this
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.conreDataStack.persistentContainer.viewContext {
                // creating instance of the class in our context
                let restaurant = Restaurant(context: context)
                restaurant.name = restaurantTextField.text
                restaurant.location = addressTextField.text
                restaurant.type = typeTextField.text
                restaurant.isVisited = isVisited
                if let image = imageView.image {
                    restaurant.image = UIImagePNGRepresentation(image)
                }
                
                // saving the content
                do {
                    try context.save()
                    print("Data has been saved")
                } catch let error as NSError {
                    print("Data hasn't been saved \(error), \(error.userInfo)")
                }
                
            }
            
            
            
            
            
            performSegue(withIdentifier: "unwindSegueFromNewEatery", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yesButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        noButton.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // ...EditedImage - to have ability save edited image
        imageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let alertController = UIAlertController(title: "Image Source", message: nil, preferredStyle: .actionSheet)
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { (action) in
                self.chooseImagePickerAction(source: .camera)
            })
            let photoAction = UIAlertAction(title: "Photo", style: .default, handler: { (action) in
                self.chooseImagePickerAction(source: .photoLibrary)
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let actions = [cameraAction, photoAction, cancelAction]
            for action in actions {
                alertController.addAction(action)
            }
            present(alertController, animated: true, completion: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // function for action closure in camera and photo alert controller actions
    func chooseImagePickerAction(source: UIImagePickerControllerSourceType) {
        // checking is there source (camera and photo) on device - can be device without them?
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }

}
