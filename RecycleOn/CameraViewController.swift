//
//  CameraViewController.swift
//  RecycleOn
//
//  Created by Aristotel Fani on 12/6/18.
//  Copyright © 2018 SAKT. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

var currentPoints: Int = 0

class CameraViewController: UIViewController {
    
    @IBOutlet weak var launchCamera: UIImageView!
    let imageTapRecognizer = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        launchCamera.isUserInteractionEnabled = true
        imageTapRecognizer.addTarget(self, action: #selector(CameraViewController.takeImage(_:)))
        launchCamera.addGestureRecognizer(imageTapRecognizer)
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Database.database().reference().child("users").child(uid).observe(.value) { (snapshot) in
            if snapshot.exists() {
                if let points = snapshot.childSnapshot(forPath: "points").value as? Int {
                    currentPoints = points
                }
            }
        }
    }
    

    @IBAction func takeImage(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "ShowCamera", sender: nil)
    }
}



extension UIViewController {
    
    func update(uid: String) {
        let db = Database.database().reference().child("users").child(uid)
        let randomInt = Int.random(in: 50 ..< 300)
        let updateValue = ["points": currentPoints + randomInt]
        db.updateChildValues(updateValue)

    }
    
    func createAlertController(title: String, message: String, image: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default) { (alert) in
            self.dismiss(animated: true, completion: nil)
            if let user = Auth.auth().currentUser?.uid { self.update(uid: user) }
            
        }
        alertController.addAction(ok)
        let imageView = UIImageView(frame: CGRect(x: (view.frame.size.width/2) - 120, y: 80, width: 200, height: 200))
        
        imageView.image = UIImage(named: image)
        alertController.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: alertController.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 350)
        
        alertController.view.addConstraint(height)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
