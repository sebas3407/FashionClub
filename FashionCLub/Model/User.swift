//
//  User.swift
//  FashionCLub
//
//  Created by Sebastian Ortiz on 11/02/2020.
//  Copyright © 2020 Sebastian Ortiz. All rights reserved.
//

import Foundation

struct User {
    
    public static var myUser = User()

    var email: String = ""
    var password: String = ""
    var fullName: String = ""
    //    var lastName : String = ""
    //    var gender : String = ""

    init?(data: [String: Any]) {
        guard
//            let lastName = data["lastName"] as? String,
//            let gender = data["gender"] as? String,
            let email = data["email"] as? String,
            let password = data["password"] as? String,
            let fullName = data["fullName"] as? String
        else{
            return nil
        }

//        self.lastName = lastName
//        self.gender = gender
        self.email = email
        self.password = password
        self.fullName = fullName

    }
    
//    Default constructor
    init?() {
    }
}

