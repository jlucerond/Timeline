//
//  PostTableViewCell.swift
//  Timeline
//
//  Created by Joe Lucero on 8/7/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // IBOutlets
    @IBOutlet weak var postImageView: UIImageView!
    
    // Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }

    // Methods
    func updateViews() {
        self.postImageView.image = post?.photo
    }
}
