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

class WalkthroughFirstViewControllerViewController: UIViewController {

    @IBOutlet weak var btn_next: UIButton!{
        didSet{
            btn_next.setBorder(borderColor: UIColor.white.cgColor)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let db = Firestore.firestore()
        
        // Add a new document with a generated ID
        /*
        var ref: DocumentReference? = nil
        ref = db.collection("user").addDocument(data: [
            "firstName": "Ada",
            "lastName": "Lovelace"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added")
            }
        }
 */
    
        db.collection("user").whereField("email", isEqualTo: "sebasortiz2000@gmail.csom")
        .whereField("password", isEqualTo: "12345678").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let user = User.init(data: document.data())
                        print(user)
                    }
                }
        }
        
    }
}
