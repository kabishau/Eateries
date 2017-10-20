//
//  EateriesTableViewController.swift
//  Eateries
//
//  Created by Aleksey Kabishau on 1019..17.
//  Copyright © 2017 Aleksey Kabishau. All rights reserved.
//

import UIKit

class EateriesTableViewController: UITableViewController {
    
    let restaurantNames = ["Ogonёk Grill&Bar", "Елу", "Bonsai", "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Respublica", "Speak Easy", "Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"]
    
    let restaurantImages = ["ogonek.jpg", "elu.jpg", "bonsai.jpg", "dastarhan.jpg", "indokitay.jpg", "x.o.jpg", "balkan.jpg", "respublika.jpg", "speakeasy.jpg", "morris.jpg", "istorii.jpg", "klassik.jpg", "love.jpg", "shok.jpg", "bochka.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        // making images round
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        cell.thumbnailImageView.clipsToBounds = true


        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: nil, message: "Choose action", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let call = UIAlertAction(title: "Call 215-966-956\(indexPath.row)", style: .default) {
            (action: UIAlertAction) -> Void in
            let alertController = UIAlertController(title: nil, message: "Call can not be done", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okay)
            self.present(alertController, animated: true, completion: nil)
        }
        let isVisited = UIAlertAction(title: "I've been there", style: .default) { (action) in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            
        }
        
        alertController.addAction(cancel)
        alertController.addAction(call)
        alertController.addAction(isVisited)
        present(alertController, animated: true, completion: nil)
        
    }
    


}
