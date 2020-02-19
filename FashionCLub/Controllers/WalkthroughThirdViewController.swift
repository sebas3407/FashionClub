//
//  WalkthroughThirdViewController.swift
//  FashionCLub
//
//  Created by Sebas on 19/02/2020.
//  Copyright © 2020 macbookindra. All rights reserved.
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
}
