//
//  CouponsTableViewController.swift
//  RecycleOn
//
//  Created by Aristotel Fani on 12/3/18.
//  Copyright © 2018 SAKT. All rights reserved.
//

import UIKit

class CouponsTableViewController: UITableViewController {

    var companies: [String] = ["Subway - $1 Off",
                               "Dunkin Donuts - Free Donut",
                               "Starbucks - 15% Off",
                               "Footlocker - Free Socks",
                               "Walmart - $5 Off"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return companies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = companies[indexPath.row]
        cell.detailTextLabel?.text = "Redeem Now"
        cell.detailTextLabel?.textColor = .blue 

        return cell
    }
 

    

}
