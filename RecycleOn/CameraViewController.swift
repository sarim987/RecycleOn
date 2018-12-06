//
//  CameraViewController.swift
//  RecycleOn
//
//  Created by Aristotel Fani on 12/6/18.
//  Copyright © 2018 SAKT. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    
    
    @IBOutlet weak var launchCamera: UIImageView!
    let imageTapRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        launchCamera.isUserInteractionEnabled = true
        imageTapRecognizer.addTarget(self, action: #selector(CameraViewController.takeImage(_:)))
        launchCamera.addGestureRecognizer(imageTapRecognizer)
    }
    

    @IBAction func takeImage(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            presentImagePicker(with: .camera)
        } else {
            createAlertController(title: "Aww Man", message: "Can you allow our app access to your camera please.")
        }
    }
    
    //MARK: - UIImagePicker methods
    func presentImagePicker(with sourceType: UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        present(imagePicker, animated: true, completion: nil)
    }
}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
//            imageView.image = image
            print("This is where the computer vision comes in ;)")
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension UIViewController {
    func createAlertController(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
}
