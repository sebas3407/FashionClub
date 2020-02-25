//
//  ButtonExtension.swift
//  FashionCLub
//
//  Created by Sebas on 25/02/2020.
//  Copyright © 2020 macbookindra. All rights reserved.
//

import Foundation
import  UIKit

public extension UIButton {
    func setBorder(borderColor : CGColor) {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 27
        self.layer.borderWidth = 2
        self.layer.borderColor = borderColor
    }
}
