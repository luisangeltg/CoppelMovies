//
//  FirebaseViewModel.swift
//  MoviesCoppel
//
//  Created by Jesus Grimaldo on 09/11/22.
//

import Foundation
import Firebase

class FirebaseViewModel{
    
    public static let shared = FirebaseViewModel()
    
    func login(email:String, pass: String, completation: @escaping (_ done: Bool) -> Void){
        Auth.auth().signIn(withEmail: email, password: pass){ (user, error) in
            if user != nil {
                print("entro")
                completation(true)
            }else{
                if let error = error?.localizedDescription{
                    print("Error en firebase", error)
                    
                }else{
                    print("Error en la app")
                }
            }
        }
        
    }
    func createUser(email:String, pass: String, completation: @escaping (_ done: Bool) -> Void){
        Auth.auth().createUser(withEmail: email, password: pass){ (user, error) in
            if user != nil {
                print("Entro y se registro")
                completation(true)
            }else{
                if let error = error?.localizedDescription{
                    print("Error en firebase de registro", error)
                }else{
                    print("Error en la app")
                }
            }
            
        }
        
    }
    
}
