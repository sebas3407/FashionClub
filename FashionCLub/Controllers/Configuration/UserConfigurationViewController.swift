//
//  UserConfigurationViewController.swift
//  FashionCLub
//
//  Created by Sebastian Ortiz on 11/02/2020.
//  Copyright © 2020 Sebastian Ortiz. All rights reserved.
//

import UIKit
import MessageUI
import Firebase

class UserConfigurationViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }

    @IBOutlet weak var lbl_email: UILabel!
    var gender = ["Para hombre","Para mujer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_email.text = User.myUser?.email
    }
    
    @IBAction func doneConfiguration(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 3) {
            if (indexPath.row == 0) {
                shareApp()
            }
            else if (indexPath.row == 1) {
                sendEmail()
            }
        }
        else if (indexPath.section == 4){
            logout()
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
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
            mail.setToRecipients(["sebasortiz2000@gmail.com"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    @objc func logout(){
        do{
            try Auth.auth().signOut()
            let storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: Bundle.main)
            let destVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                    
            destVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            destVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                    
            self.present(destVC, animated: true, completion: nil)
        }
        catch{
            
        }
    }
}
