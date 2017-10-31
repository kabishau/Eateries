//
//  DetailEateryViewController.swift
//  Eateries
//
//  Created by Aleksey Kabishau on 1021..17.
//  Copyright © 2017 Aleksey Kabishau. All rights reserved.
//

import UIKit

class DetailEateryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    var restaurant: Restaurant!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self-sizing cell methods
        tableView.estimatedRowHeight = 38
        tableView.rowHeight = UITableViewAutomaticDimension
        
        imageView.image = UIImage(named: restaurant.image)

        // removing the rest of the unused tableView
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        //tableView.separatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        // I didn't get how this works - name of the restaurant is displayed in navigation bar
        title = restaurant.name
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailEateryTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.keyLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.keyLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.keyLabel.text = "Is Visited?"
            cell.valueLabel.text = restaurant.isVisited ? "Yes" : "No"
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
