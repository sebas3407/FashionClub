//
//  RegisterViewController.swift
//  FashionCLub
//
//  Created by Sebastian Ortiz on 13/02/2020.
//  Copyright © 2020 Sebastian Ortiz. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var et_email: UITextField!
    @IBOutlet weak var et_password: UITextField!
    @IBOutlet weak var et_repeatPassword: UITextField!
    
    var mail : String = ""
    var password : String = ""
    var repeatPassword : String = ""
    var gender : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func register(_ sender: Any) {
        
        if(isTheSamePassword(password: self.password, repeatPassword: self.password)){
            createNewUser()
        }
        else{
            //las contraseñas no concuerdan
        }
    }
    
    func isTheSamePassword(password : String, repeatPassword : String) -> Bool {
        return password == repeatPassword
    }
    
    func createNewUser(){
        
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
