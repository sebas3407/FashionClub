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
//import GoogleSignIn

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
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var lblText: UILabel! {
        didSet{
            let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.blue]

            let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.red]
 
            let attributedString1 = NSMutableAttributedString(string:"¿Eres nuevo? ", attributes:attrs1)
            let attributedString2 = NSMutableAttributedString(string:"¡Registrate!", attributes:attrs2)

            attributedString1.append(attributedString2)
            self.lblText.attributedText = attributedString1
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(goToRegisterPage))
            self.lblText.addGestureRecognizer(tap)
        }
    }
    
    let bottomColor : CGColor = UIColor.init(displayP3Red: 0.86, green: 0.86, blue: 0.89, alpha: 1).cgColor

//    var articlesData : Product = []
    var user = User()
    
    var email = ""
    var password = ""
    
    override func viewDidLoad() {
        activityIndicator.isHidden = true
        super.viewDidLoad()
    }
    
    @objc func goToRegisterPage(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destVC = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
                   
        destVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        destVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                   
        self.present(destVC, animated: true, completion: nil)
    }
    
    func goToMainPage(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destVC = storyboard.instantiateViewController(withIdentifier: "TapBarVC") as! TabBarViewController
                
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
        
        setActivityIndicator(state: 1)

        email = "sebasortiz2000@gmail.com"
        password = "12345678"
            
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if(authResult != nil){
                //We are authenticate, now we can download userData
                self?.doLogin()
            }
            else{
                self?.showErrorMessage(title: "Datos incorrectos", message: "Por favor, comprueba tu usuario y contraseña")
            }
        }
    }
    
    func doLogin(){
        let db = Firestore.firestore()
        db.collection("user").whereField("email", isEqualTo: self.email).getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            if (querySnapshot!.documents.count > 0){
                                //We found the user
                                for document in querySnapshot!.documents {
                                    User.myUser = User.init(data: document.data())
                                    self.setActivityIndicator(state: 0)
                                    self.goToMainPage()
                                }
                            }
                        }
                }
    }
    
    func setActivityIndicator(state : Int) {
        if (state == 1){
               activityIndicator.isHidden = false
               activityIndicator.startAnimating()
        }
        else{
            self.activityIndicator.stopAnimating()
        }
    }
}
