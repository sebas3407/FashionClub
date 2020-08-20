
//
//  UIViewExtension.swift
//  FashionCLub
//
//  Created by Sebas on 25/02/2020.
//  Copyright © 2020 macbookindra. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func addBorderAndCornerRadius(cornerRadius : CGFloat, borderWidth : CGFloat, borderColor: String){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = UIColor(hex: borderColor).cgColor
    }
    
    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.backgroundColor = color
        self.addSubview(subview)
        switch edge {
        case .bottom:
            subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            subview.heightAnchor.constraint(equalToConstant: thickness).isActive = true
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        default:
            break
        }
    }
    
    func setGradient(colorTop : CGColor, colorBottom : CGColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}
