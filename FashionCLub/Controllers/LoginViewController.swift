//
//  LoginViewController.swift
//  FashionCLub
//
//  Created by macbookindra on 05/02/2020.
//  Copyright © 2020 macbookindra. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var et_email: UITextField!
    @IBOutlet weak var et_password: UITextField!
    
    var articlesData : Product = []
    var user : User = []
    
    var email = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        /*

        
        let bottomColor : CGColor = UIColor.init(displayP3Red: 0.86, green: 0.86, blue: 0.89, alpha: 1).cgColor
 */

     //   et_email.setBottomBorder(bottomColor: bottomColor)
     //   et_password.setBottomBorder(bottomColor: bottomColor)
        
        }
    
    func downloadProducts() {
        let urlString = ApiService.init().getProduct
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            let dataFromUrl = data!
            do {
                
                self.articlesData = try JSONDecoder().decode(Product.self, from: dataFromUrl)
                
                DispatchQueue.main.sync {
                    print(self.articlesData)
                }
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }

    func doLogin(){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destVC = storyboard.instantiateViewController(withIdentifier: "TapBarVC") as! TabBarViewController
        
        let test = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController

        destVC.user = self.user
        
        test.a = "sebasortiz2000@gmail.com"
        
        Student.estudiante.name = "sebasortiz2000@gmail.com"
        print("Vamos a triunfar \(Student.estudiante.name)")
                
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
        
        let urlString = ApiService.init().authenticateUser(user: email, password: password)
        let url = URL(string: urlString)!
       doLogin()

        //        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//
//            let dataFromUrl = data!
//            do {
//                self.user = try JSONDecoder().decode(User.self, from: dataFromUrl)
//
//                DispatchQueue.main.sync {
//                    //Si entramos aqui, hemos podido encontrar un usuario y parsearlo, por tanto, hacemos login
//                    self.doLogin()
//                }
//            } catch let jsonError {
//                print(jsonError)
//            }
//
//            }.resume()
         //   showErrorMessage(title: "Datos incorrectos", message: "Por favor, comprueba tu email y contraseña")
    }
}
