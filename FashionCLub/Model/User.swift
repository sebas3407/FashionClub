//
//  User.swift
//  FashionCLub
//
//  Created by Sebastian Ortiz on 11/02/2020.
//  Copyright © 2020 Sebastian Ortiz. All rights reserved.
//

import Foundation

struct User {
    
    public static var userPrueba = User()

//    var firstName : String = ""
//    var lastName : String = ""
//    var gender : String = ""
    var email: String = ""
    var password: String = ""

    init?(data: [String: Any]) {
        guard
//            let firstName = data["firstName"] as? String,
//            let lastName = data["lastName"] as? String,
//            let gender = data["gender"] as? String,
            let email = data["email"] as? String,
            let password = data["password"] as? String
        else{
            return nil
        }

//        self.firstName = firstName
//        self.lastName = lastName
//        self.gender = gender
        self.email = email
        self.password = password
    }
    
//    Default constructor
    init?() {
    }
}

