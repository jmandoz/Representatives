//
//  StateDetailTableViewController.swift
//  RepresentativesJBM
//
//  Created by Jason Mandozzi on 6/27/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {

    var reps: [Representative] = []{
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var state: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let state = state {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            title = state
            RepresentativeController.searchRepresentatives(forState: state) { (repArray) in
                guard let repArray = repArray else { return }
                self.reps = repArray
                
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "repCell", for: indexPath) as? RepresentativeTableViewCell else { return UITableViewCell() }
        
        cell.rep = reps[indexPath.row]
        
        return cell
    }
}
