//
//  RegisterViewController.swift
//  FashionCLub
//
//  Created by Sebastian Ortiz on 13/02/2020.
//  Copyright © 2020 Sebastian Ortiz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var et_email: UITextField!
    @IBOutlet weak var et_password: UITextField!
    @IBOutlet weak var et_repeatPassword: UITextField!
    
    var email : String = ""
    var password : String = ""
    var repeatPassword : String = ""
    var gender : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func register(_ sender: Any) {
        
        email = et_email.text ?? ""
        password = et_password.text ?? ""
            
        createNewUser(email: self.email, password: self.password)
        
        if(isTheSamePassword(password: self.password, repeatPassword: self.password)){
        }
        else{
            //las contraseñas no concuerdan
        }
    }
    
    func isTheSamePassword(password : String, repeatPassword : String) -> Bool {
        return password == repeatPassword
    }
    
    // Add a new document with a generated ID
    func createNewUser(email : String, password : String){
        
       let db = Firestore.firestore()
       var ref: DocumentReference? = nil
       ref = db.collection("user").addDocument(data: [
           "email": email,
           "password": password
       ]) { err in
           if let err = err {
               print("Error adding document: \(err)")
           } else {
               print("User \(email) created")
           }
       }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
