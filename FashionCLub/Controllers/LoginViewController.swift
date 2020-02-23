//
//  LoginViewController.swift
//  FashionCLub
//
//  Created by Sebastian Ortiz on 05/02/2020.
//  Copyright © 2020 Sebastian Ortiz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class LoginViewController: UIViewController {

    @IBOutlet weak var et_email: UITextField!{
        didSet{
            et_email.setBottomBorder(bottomColor: bottomColor)
        }
    }
    
    @IBOutlet weak var et_password: UITextField!{
        didSet{
            et_password.setBottomBorder(bottomColor: bottomColor)
        }
    }
    
    let bottomColor : CGColor = UIColor.init(displayP3Red: 0.86, green: 0.86, blue: 0.89, alpha: 1).cgColor

    var articlesData : Product = []
    var user = User()
    
    var email = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func doLogin(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destVC = storyboard.instantiateViewController(withIdentifier: "TapBarVC") as! TabBarViewController
        
        let test = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
        
        test.a = "sebasortiz2000@gmail.com"
                
        destVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        destVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                
        self.present(destVC, animated: true, completion: nil)
    }
    
    func showErrorMessage(title : String, message : String){
        
        let myalert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        myalert.addAction(UIAlertAction(title: "Ok", style: .default))

        self.present(myalert, animated: true)
    }
    
    @IBAction func checkCredentials(_ sender: UIButton) {
        
        email = et_email.text ?? ""
        password = et_password.text ?? ""
        
        #if DEBUG
        email = "sebasortiz2000@gmail.com"
        password = "12345678"
        #endif
            
        let db = Firestore.firestore()
        
        db.collection("user").whereField("email", isEqualTo: email).whereField("password", isEqualTo: password).getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if (querySnapshot!.documents.count > 0){
                        //We found the user
                        for document in querySnapshot!.documents {
                            self.user = User.init(data: document.data())
                            self.doLogin()
                        }
                    }
                    else{
                        self.showErrorMessage(title: "Datos incorrectos", message: "Por favor, comprueba tu usuario y contraseña")
                    }
                }
        }
    }
}
