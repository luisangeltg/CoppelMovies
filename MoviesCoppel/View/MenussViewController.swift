//
//  MenussViewController.swift
//  MoviesCoppel
//
//  Created by Jesus Grimaldo on 17/11/22.
//

import UIKit
import Firebase

class MenussViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func salirr(_ sender: UIButton) {
        try! Auth.auth().signOut()
        UserDefaults.standard.removeObject(forKey: "sesion")
        dismiss(animated: true, completion: nil)
        
    }
    
}
