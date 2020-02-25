
//
//  UIViewExtension.swift
//  FashionCLub
//
//  Created by Sebas on 25/02/2020.
//  Copyright © 2020 macbookindra. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setGradient(colorTop : CGColor, colorBottom : CGColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}
