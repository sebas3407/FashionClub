//
//  UserConfigurationViewController.swift
//  FashionCLub
//
//  Created by macbookindra on 11/02/2020.
//  Copyright © 2020 macbookindra. All rights reserved.
//

import UIKit

class UserConfigurationViewController: UITableViewController {

    @IBOutlet weak var lbl_email: UILabel!
    
    var user : User = []
    var prueba : String = "klhlkjkj"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_email.text = prueba
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
