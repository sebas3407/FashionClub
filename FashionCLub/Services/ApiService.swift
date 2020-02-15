//
//  ApiService.swift
//  FashionCLub
//
//  Created by macbookindra on 13/02/2020.
//  Copyright © 2020 macbookindra. All rights reserved.
//

import Foundation

public class ApiService {
    public let getProduct : String = "http://sebastian-ortiz.000webhostapp.com/product.json"
    
    func creatreProduct(){}
    
    func modifyProduct(){}
    
    func deleteProduct(){}
    
    func authenticateUser(user : String, password : String) -> String {
        return "https://sebastian-ortiz.000webhostapp.com/authentication.json"
        //return "http://sebastian-ortiz.000webhostapp.com/user=\(user)&password=\(password)"
    }
    
    func getUser(user : String) -> String {
        return "https://sebastian-ortiz.000webhostapp.com/authenticatison.json"
        //return "http://sebastian-ortiz.000webhostapp.com/user=\(user)"
    }
        
}

