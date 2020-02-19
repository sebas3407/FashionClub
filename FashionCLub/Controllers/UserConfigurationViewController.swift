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
        lbl_email.text = Student.estudiante.name
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 3) {
            if (indexPath.row == 0) {
                shareApp()
            }
            else if (indexPath.row == 1) {
                sendMail()
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
    
    func sendMail(){
        
    }
}
