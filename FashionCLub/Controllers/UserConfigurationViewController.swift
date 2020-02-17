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
    @IBOutlet weak var tableSection: UITableViewCell!
    
    var user : User = []
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("index path \(indexPath.row)")
        print("index section \(indexPath.section)")
        if (indexPath.section == 3) {
            if (indexPath.row == 0){
                shareApp()
            }
        }
    }
    
    func shareApp(){
        let text = "Prueba FashionClub, la nueva app de ropa de moda"

        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]

        self.present(activityViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("que tenemos por aqui\(Student.estudiante.name) ")
        lbl_email.text = Student.estudiante.name
    }
}
