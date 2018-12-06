//
//  UserPageViewController.swift
//  RecycleOn
//
//  Created by Aristotel Fani on 12/6/18.
//  Copyright © 2018 SAKT. All rights reserved.
//

import UIKit
import FirebaseAuth

class UserPageViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userPoints: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = Auth.auth().currentUser,
            let name = user.displayName,
            let email = user.email {
            userName.text = name
            userEmail.text = email
        }

        // Do any additional setup after loading the view.
    }

}
