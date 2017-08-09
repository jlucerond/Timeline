//
//  Post.swift
//  Timeline
//
//  Created by Joe Lucero on 8/7/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class Post: SearchableRecord {
    let photoData: Data?
    let timestamp: Date?
    var comments: [Comment]
    var photo: UIImage? {
        guard let photoData = photoData else { return nil }
        return UIImage(data: photoData)
    }
    
    init(photoData: Data?, timestamp: Date? = Date(), comments: [Comment] = []) {
        self.photoData = photoData
        self.timestamp = timestamp
        self.comments = comments
    }
    
    func matches(searchTerm: String) -> Bool {
        for comment in comments {
            if comment.matches(searchTerm: searchTerm) { return true }
        }
        
        return false
    }
}
