//
//  MenuViewController.swift
//  MoviesCoppel
//
//  Created by Jesus Grimaldo on 17/11/22.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {

  
    @IBAction func salir(_ sender: UIButton) {
        try! Auth.auth().signOut()
        UserDefaults.standard.removeObject(forKey: "sesion")
        dismiss(animated: true,completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }
    

    

}
