//
//  PostController.swift
//  Timeline
//
//  Created by Joe Lucero on 8/7/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class PostController {
    static let shared = PostController()
    
    var posts: [Post] = []
    
    func createPostWith(image: UIImage, caption: String) {
        let imageData = UIImagePNGRepresentation(image)
        let newPost = Post(photoData: imageData)
        addCommentTo(post: newPost, with: caption)
        posts.append(newPost)
    }
    
    func addCommentTo(post: Post, with text: String) {
        let newComment = Comment(text: text, post: post)
        post.comments.append(newComment)
    }
    
    
}
