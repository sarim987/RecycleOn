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
//        performSegue(withIdentifier: "ShowCamera", sender: nil)
        createAlertController(title: "Complete", message: "You earned 100 points", image: "checkmark")
    }
    
}



extension UIViewController {
    func createAlertController(title: String, message: String, image: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(ok)
        let imageView = UIImageView(frame: CGRect(x: (alertController.view.frame.size.width/2) - 100, y: 80, width: 100, height: 100))
        
        imageView.image = UIImage(named: image)
        alertController.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: alertController.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        
        alertController.view.addConstraint(height)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
