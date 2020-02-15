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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("que tenemos por aqui\(Student.estudiante.name) ")
        lbl_email.text = Student.estudiante.name
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
