//
//  Comment.swift
//  Timeline
//
//  Created by Joe Lucero on 8/7/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import Foundation

class Comment: SearchableRecord {
    let text: String
    let timestamp: Date
    let post: Post
    
    init(text: String, timestamp: Date = Date(), post: Post) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
    
    func matches(searchTerm: String) -> Bool {
        return text.lowercased().contains(searchTerm.lowercased())
    }
}
