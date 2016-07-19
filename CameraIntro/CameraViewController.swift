//
//  CameraViewController.swift
//  CameraIntro
//
//  Created by James O'Connor on 7/13/16.
//  Copyright © 2016 James O'Connor. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var photoImageView:UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CameraViewController.openImageOptions(_:)))
        photoImageView.userInteractionEnabled = true
        photoImageView.addGestureRecognizer(tap)

    }
    
    
    
    func openImageOptions(img: AnyObject) {
        
        print("Image Tapped")
        
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
    
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .ActionSheet)
        
        let chooseFromLibraryAction = UIAlertAction(title:"Choose from Library", style: .Default)
            { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .PhotoLibrary
          
            self.presentViewController(imagePickerViewController, animated:true, completion: nil)
            
            print("You Chose From Library")
        }
        
    let takePictureAction = UIAlertAction(title:"Use Camera", style: .Default) { (alert :UIAlertAction) in
        
            imagePickerViewController.sourceType = .Camera
                
            self.presentViewController(imagePickerViewController, animated: true, completion:nil)
        }
        
    let cancelAction = UIAlertAction(title:"Cancel", style: .Cancel)
            { (alert :UIAlertAction) in
            
        }
        
    alertController.addAction(chooseFromLibraryAction)
    alertController.addAction(takePictureAction)
    alertController.addAction(cancelAction)
    
        self.presentViewController(alertController, animated:true, completion: nil)
    
    }
    

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.photoImageView.image = originalImage
        
        picker.dismissViewControllerAnimated(true, completion:nil)
        
    }
    
    
    @IBAction func saveButton(sender: AnyObject) {
        
        let imageData = UIImageJPEGRepresentation(photoImageView.image!, 1.0)
        let saveImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(saveImage!, nil, nil, nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

