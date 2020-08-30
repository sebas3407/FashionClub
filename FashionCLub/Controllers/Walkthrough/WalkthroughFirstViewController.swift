//
//  WalkthroughFirstViewControllerViewController.swift
//  FashionCLub
//
//  Created by Sebas on 20/02/2020.
//  Copyright © 2020 Sebastian Ortiz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class WalkthroughFirstViewController: UIViewController {

    @IBOutlet weak var btn_next: UIButton!{
        didSet{
            btn_next.setBorder(borderColor: UIColor.white.cgColor)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
