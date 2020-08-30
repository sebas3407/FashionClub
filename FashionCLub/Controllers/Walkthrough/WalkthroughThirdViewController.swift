//
//  WalkthroughThirdViewController.swift
//  FashionCLub
//
//  Created by Sebas on 19/02/2020.
//  Copyright © 2020 Sebastian Ortiz. All rights reserved.
//

import UIKit

class WalkthroughThirdViewController: UIViewController {

    @IBOutlet weak var btn_next: UIButton!{
        didSet{
            btn_next.setBorder(borderColor: UIColor.white.cgColor)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToLoginPage(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: Bundle.main)
        let destVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        destVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        destVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        self.present(destVC, animated: true, completion: nil)
    }
}
