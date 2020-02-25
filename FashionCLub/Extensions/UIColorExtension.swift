//
//  UIColorExtension.swift
//  FashionCLub
//
//  Created by Sebas on 25/02/2020.
//  Copyright © 2020 macbookindra. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
     convenience init(hex: Int, alpha: Double = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
}
