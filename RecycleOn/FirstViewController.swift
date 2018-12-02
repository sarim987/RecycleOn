//
//  FirstViewController.swift
//  RecycleOn
//
//  Created by Sarim Ahmed on 11/26/18.
//  Copyright © 2018 SAKT. All rights reserved.
//

import UIKit
import FirebaseUI

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func loginTapped(_ sender: UIButton) {
        
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else {
            return
        }
        
        authUI?.delegate = self
        
        let authViewController = authUI!.authViewController()
        
        present(authViewController, animated: true, completion: nil)
        
    }
}
extension FirstViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            return
        }
        performSegue(withIdentifier: "goHome", sender: self)
    }
}

