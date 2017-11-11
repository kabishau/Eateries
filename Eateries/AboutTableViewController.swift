//
//  AboutTableViewController.swift
//  Eateries
//
//  Created by user131656 on 11/8/17.
//  Copyright © 2017 Aleksey Kabishau. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {
    
    let sectionsHeaders = ["Social Media", "Websites"]
    let sectionsContent = [["facebook", "vk", "youtube"], ["swiftbook.ru", "forum.swiftbook.ru"]]
    let firstSectionLinks = ["https://www.facebook.com/swiftbook.ru/", "https://vk.com/swiftbook", "https://www.youtube.com/channel/UCXlCPCsB09ftBA5bQfiSWoQ"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // removing unnecessary row at the bottom
        tableView.tableFooterView = UIView(frame: .zero)

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsHeaders.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsHeaders[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsContent[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sectionsContent[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // selected rows from first section making transition to Web View Controller
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0..<firstSectionLinks.count:
                performSegue(withIdentifier: "showWebPageSegue", sender: self)
            default: break
            }
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // it's important to call this method after didSelectRowAt because at the and of that method row is deselected (it will be nil)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebPageSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! WebViewController
                destinationViewController.url = URL(string: firstSectionLinks[indexPath.row])
            }
        }
    }

}
