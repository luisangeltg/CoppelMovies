//
//  ViewController.swift
//  MoviesCoppel
//
//  Created by Jesus Grimaldo on 09/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if (UserDefaults.standard.object(forKey: "sesion") != nil){
            self.next(identificador: "entrar")
        }
    }

    @IBAction func entrar(_ sender: UIButton) {
        guard let emailtxt = email.text else { return }
        guard let passtxt =  password.text else { return }
        FirebaseViewModel.shared.login(email: emailtxt, pass: passtxt) { (done) in
            if done{
                UserDefaults.standard.set(true, forKey: "sesion")
                self.next(identificador: "entrar")
            }
        }
    }
    
    @IBAction func registrarse(_ sender: UIButton) {
        guard let emailtxt = email.text else { return }
        guard let passtxt =  password.text else { return }
        
        FirebaseViewModel.shared.createUser(email: emailtxt, pass: passtxt) { (done) in
            UserDefaults.standard.set(true, forKey: "sesion")
            self.next(identificador: "entrar")
        }
        
    }
    
    func next(identificador: String){
        performSegue(withIdentifier: identificador, sender: self)
    }
}

