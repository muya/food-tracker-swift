//
//  ViewController.swift
//  FoodTracker
//
//  Created by Muya on 14/07/2015.
//  Copyright © 2015 muya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
    UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    let DEFAULT_MEAL_LABEL_TEXT = "Your Meal"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        let trimmedText = textField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if trimmedText != "" {
            mealNameLabel.text = trimmedText
            textField.text = trimmedText
        }
        else {
            mealNameLabel.text = DEFAULT_MEAL_LABEL_TEXT
            textField.text = ""
        }
    }
    
    // MARK UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // just dismiss the image picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        // info dictionary contains multiple representations of the image, and
        // this uses the original
        print(info)
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // display selected image in the ui
        // set aspect ratio while at the same time respecting the image's ratio
        photoImageView.contentMode = .ScaleAspectFit
        photoImageView.image = selectedImage
        
        // dismiss the image picker
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // hide the keyboard
        nameTextField.resignFirstResponder()
        
        // allow user to pick media from photo library
        let imagePickerController = UIImagePickerController()
        
        // make sure ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        
        // only allow photos to be picked, not taken
        imagePickerController.sourceType = .PhotoLibrary
        
        // present the image picker
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
}

