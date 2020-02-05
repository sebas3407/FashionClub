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
                
        //TODO, move this to extension file
        let border = CALayer()
         let width = CGFloat(1.0)
        border.borderColor = UIColor.init(displayP3Red: 0.86, green: 0.86, blue: 0.89, alpha: 1).cgColor
        border.borderWidth = 4
        border.frame = CGRect(x: 0, y: et_email.frame.size.height - width, width:  et_email.frame.size.width, height: et_email.frame.size.height)
         border.borderWidth = width
         et_email.layer.addSublayer(border)
         et_email.layer.masksToBounds = true
    

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var et_email: UITextField!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
