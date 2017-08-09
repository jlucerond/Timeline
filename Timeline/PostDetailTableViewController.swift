//
//  PostDetailTableViewController.swift
//  Timeline
//
//  Created by Joe Lucero on 8/7/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {

    var post: Post?
    @IBOutlet weak var postImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44
        updateViews()
    }
    
    // MARK: - IBActions
    @IBAction func addCommentButtonPressed(_ sender: UIBarButtonItem) {
        presentCommentAlertController()
    }
    
    @IBAction func shareButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func followButtonPressed(_ sender: UIBarButtonItem) {
    }

    
    // MARK: - Helper Methods
    func updateViews() {
        if let post = post {
            postImageView.image = post.photo
            tableView.reloadData()
        }
    }
    
    func presentCommentAlertController() {
        
        guard let post = post else { return }
        let alertController = UIAlertController(title: "Add Comment", message: nil, preferredStyle: .alert)
        
        var commentTextField = UITextField()
        
        alertController.addTextField { (textField) in
            commentTextField = textField
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (_) in
                                        guard let commentText = commentTextField.text,
                                            !commentText.isEmpty else { return }
                                        PostController.shared.addCommentTo(post: post, with: commentText)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: TableView Methods
extension PostDetailTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath)
        
        if let post = post {
            let comment = post.comments[indexPath.row]
            cell.textLabel?.text = comment.timestamp.description
            cell.detailTextLabel?.text = comment.text
        }
        
        return cell
    }
    
    // FIXME: - I'll need to add something here later?
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
