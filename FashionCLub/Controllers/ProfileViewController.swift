//
//  ProfileViewController.swift
//  FashionCLub
//
//  Created by macbookindra on 13/02/2020.
//  Copyright © 2020 macbookindra. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var a : String = "a"
    override func viewDidLoad() {
        super.viewDidLoad()

        let destVC = storyboard?.instantiateViewController(withIdentifier: "TapBarVC") as! TabBarViewController
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
