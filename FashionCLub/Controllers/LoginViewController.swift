//
//  LoginViewController.swift
//  FashionCLub
//
//  Created by macbookindra on 05/02/2020.
//  Copyright © 2020 macbookindra. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let bottomColor : CGColor = UIColor.init(displayP3Red: 0.86, green: 0.86, blue: 0.89, alpha: 1).cgColor
        
        et_email.setBottomBorder(bottomColor: bottomColor)
        et_password.setBottomBorder(bottomColor: bottomColor)
        
        DownloadQuote()
    }
    
    func DownloadQuote()
    {
        
        //Implementing URLSession
        let urlString = "http://sebastian-ortiz.000webhostapp.com/product.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let dataFromUrl = data else { return }
            do {
                
                let articlesData = try JSONDecoder().decode(Product.self, from: dataFromUrl)
                
                DispatchQueue.main.async {
                    
                    print(articlesData)
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
        //End implementing URLSession
        
        
    }
    
    @IBOutlet weak var et_email: UITextField!
    @IBOutlet weak var et_password: UITextField!
    
    var email = ""
    var password = ""
    
    @IBAction func doLogin(_ sender: UIButton) {
        
        email = et_email.text ?? ""
        password = et_password.text ?? ""
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destVC = storyboard.instantiateViewController(withIdentifier: "TapBarVC") as! TabBarViewController
        
        destVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        destVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                
        self.present(destVC, animated: true, completion: nil)
        
        if(email == "test" && password == "test"){
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let destVC = storyboard.instantiateViewController(withIdentifier: "TapBarVC") as! TabBarViewController
            
            destVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            destVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                    
            self.present(destVC, animated: true, completion: nil)
        }
        else{
            let myalert = UIAlertController(title: "Datos incorrectos", message: "Por favor, verifica tu email y contraseña", preferredStyle: UIAlertController.Style.alert)
            myalert.addAction(UIAlertAction(title: "Ok", style: .default))

            self.present(myalert, animated: true)
        }
    }
}
