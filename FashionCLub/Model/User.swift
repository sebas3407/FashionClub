//
//  User.swift
//  FashionCLub
//
//  Created by Sebastian Ortiz on 11/02/2020.
//  Copyright © 2020 Sebastian Ortiz. All rights reserved.
//

import Foundation

// MARK: - UserElement
struct UserElement: Codable {
    let email, password, name, surname: String
}

typealias User = [UserElement]

class Student {
    public static var estudiante = Student()
   var name: String = ""
}
