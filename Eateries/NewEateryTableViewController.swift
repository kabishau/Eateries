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


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }

}
