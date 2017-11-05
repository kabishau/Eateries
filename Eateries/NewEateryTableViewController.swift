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
                
            })
            let photoAction = UIAlertAction(title: "Photo", style: .default, handler: { (action) in
                
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cameraAction)
            alertController.addAction(photoAction)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
            
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
