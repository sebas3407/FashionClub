//
//  User.swift
//  FashionCLub
//
//  Created by Sebastian Ortiz on 11/02/2020.
//  Copyright © 2020 Sebastian Ortiz. All rights reserved.
//

import Foundation

struct User {

    var email: String
    var password: String

    init?(data: [String: Any]) {

        guard let email = data["email"] as? String,
            let password = data["password"] as? String
            else{
                return nil
        }

        self.email = email
        self.password = password
    }
    
    init?() {
        self.email = ""
        self.password = ""
    }
}
