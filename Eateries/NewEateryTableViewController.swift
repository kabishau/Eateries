//
//  NewEateryTableViewController.swift
//  Eateries
//
//  Created by user131656 on 11/4/17.
//  Copyright © 2017 Aleksey Kabishau. All rights reserved.
//

import UIKit

class NewEateryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }

}
