//
//  PhotoSelectViewController.swift
//  Timeline
//
//  Created by Joe Lucero on 8/8/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class PhotoSelectViewController: UIViewController {
    
    // MARK: Actions
    @IBAction func selectPhotoButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alert = UIAlertController(title: "Select Photo Location", message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library",
                                                   style: .default,
                                                   handler: { (_) -> Void in
                                                    imagePicker.sourceType = .photoLibrary
                                                    self.present(imagePicker, animated: true, completion: nil)
            })
            
            alert.addAction(photoLibraryAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera",
                                             style: .default,
                                             handler: { (_) -> Void in
                                                imagePicker.sourceType = .camera
                                                self.present(imagePicker, animated: true, completion: nil)
            })
            
            alert.addAction(cameraAction)
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Properties
    weak var delegate: PhotoSelectViewControllerDelegate?
    
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
}

extension PhotoSelectViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            delegate?.photoSelectViewControllerSelected(image)
            addPhotoButton.setTitle("", for: UIControlState())
            imageView.image = image
        }
    }
}



// MARK: - PhotoSelectViewControllerDelegate Methods
protocol PhotoSelectViewControllerDelegate: class {
    func photoSelectViewControllerSelected(_ image: UIImage)
}
