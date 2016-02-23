//
//  CaptureViewController.swift
//  Insta
//
//  Created by Labuser on 2/23/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageToUpload: UIImageView!
    @IBOutlet weak var captionText: UITextField!
    @IBOutlet weak var uploadView: UIView!
    
    let tapUploadView = UITapGestureRecognizer()
    let vc = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vc.delegate = self
        vc.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            vc.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        tapUploadView.addTarget(self, action: "getImage")
        uploadView.addGestureRecognizer(tapUploadView)
        uploadView.userInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        imageToUpload.image = editedImage
        uploadView.hidden = true
        
        self.dismissViewControllerAnimated(true) { () -> Void in
            print("image dismissed")
        }
    }
    
    func getImage() {
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image

        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    @IBAction func onSubmit(sender: AnyObject) {
        UserMedia.postUserImage(imageToUpload.image, withCaption: captionText.text, withCompletion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
