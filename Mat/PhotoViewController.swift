//
//  ImageViewController.swift
//  Mat
//
//  Created by Gualberto Scolari on 2017-02-28.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var objectNr : [String:Any] = [:]
    var nr : Any? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.layer.cornerRadius = self.imageView.frame.width/8.0
        self.imageView.clipsToBounds = true
        
        if let image = UIImage(contentsOfFile: imagePath(number: nr as! Int)){
            imageView.image = image
        
        } else {
            NSLog("Failed to load image from \(imagePath)")
        }
        
    }

    @IBAction func takePicture(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
            
        } else {
            fatalError("ahhhhhhhh!!!")
        }
       
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        imageView.image = image
        
        if let data = UIImagePNGRepresentation(image){
            
            do {
                let url = URL(fileURLWithPath: imagePath(number: nr as! Int))
                try data.write(to: url)
                NSLog("Done writing image to \(imagePath)")
            
            } catch let error {
                NSLog("Failed to save image data: \(error)")
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePath(number: Int) -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
         if let documentsDirectory = paths.first {
            return documentsDirectory.appending("/\(number).png")
         } else {
            fatalError("No documents directory")
         }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}



