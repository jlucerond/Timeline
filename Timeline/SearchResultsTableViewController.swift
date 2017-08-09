//
//  SearchResultsTableViewController.swift
//  Timeline
//
//  Created by Joe Lucero on 8/7/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {

    var results: [SearchableRecord] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

}

// Table View Data Source & Delegate Methods
extension SearchResultsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let result = results[indexPath.row] as? Post,
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        cell.post = result
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        guard let postListVC = presentingViewController as? PostListTableViewController else { return }
        
        postListVC.performSegue(withIdentifier: "ToDetailController", sender: tableView.cellForRow(at: indexPath))
    }
}
