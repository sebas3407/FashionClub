//
//  TextFIeldExtensions.swift
//  FashionCLub
//
//  Created by macbookindra on 06/02/2020.
//  Copyright © 2020 macbookindra. All rights reserved.
//

import Foundation
import UIKit

public extension UITextField {
    func setBottomBorder(bottomColor : CGColor) {

        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.init(displayP3Red: 0.86, green: 0.86, blue: 0.89, alpha: 1).cgColor
        border.borderWidth = 4
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
