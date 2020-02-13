//
//  Product.swift
//  FashionCLub
//
//  Created by macbookindra on 13/02/2020.
//  Copyright © 2020 macbookindra. All rights reserved.
//

import Foundation

// MARK: - ProductElement
struct ProductElement: Codable {
    let id, name, platform, productDescription: String
    let points, price, image: String

    enum CodingKeys: String, CodingKey {
        case id, name, platform
        case productDescription = "description"
        case points, price, image
    }
}

typealias Product = [ProductElement]
