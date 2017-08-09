//
//  PostListTableViewController.swift
//  Timeline
//
//  Created by Joe Lucero on 8/7/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
}

// MARK: - Table View Data Source Methods
extension PostListTableViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return PostController.shared.posts.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = PostController.shared.posts[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        cell.post = post
        return cell
    }
}

// MARK: - Navigation
extension PostListTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailController" {
            guard let cellSelected = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cellSelected),
            let nextVC = segue.destination as? PostDetailTableViewController else { return }
            
            nextVC.post = PostController.shared.posts[indexPath.row]
        }
    }
}

// MARK: - Create Search Results Table View Controller
extension PostListTableViewController: UISearchResultsUpdating {
    func setUpSearchController() {
        let searchResultsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultsTableViewController")
        
        let searchController = UISearchController(searchResultsController: searchResultsVC)
        searchController.searchResultsUpdater = self
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let resultsViewController = searchController.searchResultsController as? SearchResultsTableViewController,
            let searchTerm = searchController.searchBar.text?.lowercased() {
            
            let posts = PostController.shared.posts
            
            let filteredPosts = posts.filter { $0.matches(searchTerm: searchTerm) }.map { $0 as SearchableRecord }
            resultsViewController.results = filteredPosts
            resultsViewController.tableView.reloadData()
        }
    }
    
    /*
     Implement the UISearchResultsUpdating protocol updateSearchResults(for searchController: UISearchController) function. The function should capture the resultsViewController and the search text from the searchController's searchBar, filter the local posts array for posts that match, assign the filtered results to the resultsViewController's resultsArray, and reload the resultsViewController's tableView.
     note: Consider the communication that is happening here between two separate view controllers. Be sure that you understand this relationship.
 */
}
