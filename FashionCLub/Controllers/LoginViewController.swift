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
    }
    
    @IBOutlet weak var et_email: UITextField!
    @IBOutlet weak var et_password: UITextField!
    
    var email = ""
    var password = ""
    
    @IBAction func doLogin(_ sender: UIButton) {
        
        email = et_email.text ?? ""
        password = et_password.text ?? ""
        
        if(email == "test" && password == "test"){
            
        }
        else{
            
        }
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destVC = storyboard.instantiateViewController(withIdentifier: "TapBarVC") as! TabBarViewController
        
        destVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        destVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                
        self.present(destVC, animated: true, completion: nil)
    }
}
