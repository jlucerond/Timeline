//
//  AddPostTableViewController.swift
//  Timeline
//
//  Created by Joe Lucero on 8/7/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {

    @IBOutlet weak var newImageForPost: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageButtonPressed(_ sender: UIButton) {
        newImageForPost.image = #imageLiteral(resourceName: "ReggieWatts")
        sender.setTitle("", for: .normal)
    }
    
    @IBAction func addPostButtonPressed(_ sender: UIButton) {
        guard let newImage = newImageForPost.image,
            let newCaption = commentTextField.text,
            !newCaption.isEmpty else { return }
        
        PostController.shared.createPostWith(image: newImage, caption: newCaption)
        dismiss(animated: true, completion: nil)
    }

}
