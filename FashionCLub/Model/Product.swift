//
//  Product.swift
//  FashionCLub
//
//  Created by Sebastian Ortiz on 13/02/2020.
//  Copyright © 2020 Sebastian Ortiz. All rights reserved.
//

import Foundation

// MARK: - Product
struct Product {

    var id : String = ""
    var type : String = ""
    var productDescription : String = ""
    var price : Double = 0.0
    var image : String = ""

    init?(data: [String: Any]) {
        guard
            let id = data["id"] as? String,
            let type = data["type"] as? String,
            let productDescription = data["productDescription"] as? String,
            let price = data["price"] as? Double,
            let image = data["image"] as? String
        else{
            return nil
        }

        self.id = id
        self.type = type
        self.productDescription = productDescription
        self.price = price
        self.image = image
    }
        
    // Default constructor
    init?() {
    }
}
