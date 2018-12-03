//
//  SecondViewController.swift
//  RecycleOn
//
//  Created by Sarim Ahmed on 11/26/18.
//  Copyright © 2018 SAKT. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    var usernames: [String] = ["Johnny", "Rachel", "Joe", "Tajour", "Sarim", "Khang", "Ari"]
    var userpoints: [Int] = [1000, 850, 840, 650, 600, 550, 500]
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.rowHeight = 75
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension LeaderboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usernames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = usernames[indexPath.row]
        cell.detailTextLabel?.text = "\(userpoints[indexPath.row]) points"
        return cell
    }
}

