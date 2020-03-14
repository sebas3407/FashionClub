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
    
    @IBOutlet weak var et_fullName: UITextField! {
        didSet{
            et_fullName.setBottomBorder(bottomColor: UIColor.init(named: "et_bottomColor")!.cgColor)
        }
    }
    
    @IBOutlet weak var et_email: UITextField!{
        didSet{
            et_email.setBottomBorder(bottomColor: UIColor.init(named: "et_bottomColor")!.cgColor)
        }
    }
    @IBOutlet weak var et_password: UITextField!
    @IBOutlet weak var et_repeatPassword: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var lblText: UILabel! {
        didSet{
            let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.blue]

            let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.red]

           let attributedString1 = NSMutableAttributedString(string:"¿Tienes una cuenta? ", attributes:attrs1)
           let attributedString2 = NSMutableAttributedString(string:"¡Inicia sesión!", attributes:attrs2)

           attributedString1.append(attributedString2)
           self.lblText.attributedText = attributedString1
            
           let tap = UITapGestureRecognizer(target: self, action: #selector(goToLoginPage))
           self.lblText.addGestureRecognizer(tap)
        }
    }
    var fullName : String = ""
    var gender : String = ""
    var email : String = ""
    var password : String = ""
    var repeatPassword : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
    }

    @IBAction func register(_ sender: Any) {
        
        fullName = et_fullName.text ?? ""
        email = et_email.text ?? ""
        password = et_password.text ?? ""
        repeatPassword = et_repeatPassword.text ?? ""
        
        #if DEBUG
        password = "12345678"
        repeatPassword = "12345678"
        #endif
        
        if(isTheSamePassword(password: self.password, repeatPassword: self.repeatPassword)){
            createNewUser(email: self.email, password: self.password, fullName: self.fullName)
        }
        else{
            //las contraseñas no concuerdan
        }
    }
    
    func isTheSamePassword(password : String, repeatPassword : String) -> Bool {
        return password == repeatPassword
    }
    
    // Add a new document with a generated ID
    func createNewUser(email : String, password : String, fullName : String){
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let err = error {
                print("Error adding document: \(err)")
            } else {
                print("Authentication for user \(email) created")
                
                 //Create firestore account
                 let db = Firestore.firestore()
                 let ref: DocumentReference? = db.collection("user").addDocument(data: [
                    "email": email,
                    "password": password,
                    "fullName": fullName
                    
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Database register for user \(email) created")
                    }
                }
            }
        }
    }
    
    @objc func goToLoginPage(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
                   
        destVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        destVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                   
        self.present(destVC, animated: true, completion: nil)
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
