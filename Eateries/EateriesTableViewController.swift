//
//  EateriesTableViewController.swift
//  Eateries
//
//  Created by Aleksey Kabishau on 1019..17.
//  Copyright © 2017 Aleksey Kabishau. All rights reserved.
//

import UIKit
import CoreData

class EateriesTableViewController: UITableViewController {
    
    var restaurants: [Restaurant] = []
    
    var fetchResultsController: NSFetchedResultsController<Restaurant>!
    

    // unwindSegue from cancel button on new restaurant screen
    @IBAction func close(segue: UIStoryboardSegue) {        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self-sizing cell establishing
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // removing name from back button in navigation bar for detail view controller
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        // fetching data from Core Data
        let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
        // gives the data that is sorted by field name
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        // applying created sortDescriptor to fetchRequest
        fetchRequest.sortDescriptors = [sortDescriptor]
        // creating the context
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.conreDataStack.persistentContainer.viewContext {
            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            
            do {
                try fetchResultsController.performFetch()
                restaurants = fetchResultsController.fetchedObjects!
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.thumbnailImageView.image = UIImage(data: restaurants[indexPath.row].image! as Data)
        cell.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        // making images round
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        cell.thumbnailImageView.clipsToBounds = true

        return cell
    }

/*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: nil, message: "Choose action", preferredStyle: .actionSheet)
        
        // cancel action
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        
        // call action
        let call = UIAlertAction(title: "Call 215-966-956\(indexPath.row)", style: .default) {
            (action: UIAlertAction) -> Void in
            let alertController = UIAlertController(title: nil, message: "Call can not be done", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okay)
            self.present(alertController, animated: true, completion: nil)
        }
        alertController.addAction(call)
        
        // check-in/check-out action
        let visitedTitle = self.restaurants[indexPath.row].isVisited ? "Check out" : "Check In"
        let isVisited = UIAlertAction(title: visitedTitle, style: .default) { (action) in

            let cell = tableView.cellForRow(at: indexPath)
            self.restaurants[indexPath.row].isVisited = !self.restaurants[indexPath.row].isVisited
            cell?.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
        }
        alertController.addAction(isVisited)
        
        
        present(alertController, animated: true, completion: nil)
        
        // deselecting standart highlighting
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
*/
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            restaurants.remove(at: indexPath.row)
//        }
//        tableView.deleteRows(at: [indexPath], with: .fade)
//    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            self.restaurants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            
            let defaulText = "I'm in " + self.restaurants[indexPath.row].name!
            if let image = UIImage(data: self.restaurants[indexPath.row].image! as Data) {
                let activityController = UIActivityViewController(activityItems: [defaulText, image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        }
        
        delete.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        share.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        return [delete, share]
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! DetailEateryViewController
                destinationViewController.restaurant = self.restaurants[indexPath.row]
            }
        }
    }
    
    
    


}
