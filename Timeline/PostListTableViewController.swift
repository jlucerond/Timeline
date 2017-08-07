//
//  PostListTableViewController.swift
//  Timeline
//
//  Created by Joe Lucero on 8/7/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {

    
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
            guard let indexPath = tableView.indexPathForSelectedRow,
            let nextVC = segue.destination as? PostDetailTableViewController else { return }
            
            nextVC.post = PostController.shared.posts[indexPath.row]
        }
    }
}
