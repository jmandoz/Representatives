//
//  StateListTableViewController.swift
//  RepresentativesJBM
//
//  Created by Jason Mandozzi on 6/27/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return States.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)

        // Configure the cell...
        let state = States.all[indexPath.row]
        
        cell.textLabel?.text = state

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToStateDetailVC" {
            guard let destinationVC = segue.destination as? StateDetailTableViewController,
                let index = tableView.indexPathForSelectedRow else { return }
            destinationVC.state = States.all[index.row]
        }
    }
    

}
