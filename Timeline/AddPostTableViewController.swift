//
//  AddPostTableViewController.swift
//  Timeline
//
//  Created by Joe Lucero on 8/7/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var commentTextField: UITextField!
    
    // MARK: - Properties
    var newImageForPost: UIImage?
    
    // MARK: - IBActions
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPostButtonPressed(_ sender: UIButton) {
        guard let newImage = newImageForPost,
            let newCaption = commentTextField.text,
            !newCaption.isEmpty else { return }
        
        PostController.shared.createPostWith(image: newImage, caption: newCaption)
        dismiss(animated: true, completion: nil)
    }
    
}

//
extension AddPostTableViewController: PhotoSelectViewControllerDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoSelectViewController" {
            guard let photoSelectVC = segue.destination as? PhotoSelectViewController else { return }
            
            photoSelectVC.delegate = self
        }
    }
    func photoSelectViewControllerSelected(_ image: UIImage) {
        newImageForPost = image
    }
}
