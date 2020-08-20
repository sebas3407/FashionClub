//
//  UITextField.swift
//  lamevasalut
//
//  Created by Sebas on 05/06/2020.
//  Copyright © 2020 Raúl Conesa. All rights reserved.
//

import Foundation
import UIKit

//Used in the login view

extension UITextField {
    
    enum Direction {
        case Left
        case Right
    }
    
    func addBorderAndCornerRadius(cornerRadius : CGFloat, borderWidth : CGFloat, borderColorString : String = "", borderColor : UIColor){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        if(borderColorString != ""){
            self.layer.borderColor = UIColor(hex: borderColorString).cgColor
        }
        else{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    func setBottomBorder(bottomColor : CGColor) {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = bottomColor
       // border.borderColor = UIColor.init(displayP3Red: 0.86, green: 0.86, blue: 0.89, alpha: 1).cgColor
        border.borderWidth = 4
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    // add image to textfield
    func withImage(direction: Direction = .Right, image: UIImage, isHidden : Bool){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        mainView.layer.cornerRadius = 5

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = CGFloat(0.5)
//        view.layer.borderColor = colorBorder.cgColor
        mainView.addSubview(view)

        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
        view.addSubview(imageView)

        let seperatorView = UIView()
        seperatorView.backgroundColor = .white
        mainView.addSubview(seperatorView)

        if(Direction.Left == direction){ // image left
            seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
            self.rightViewMode = .always
            self.rightView = mainView
        }

//        self.layer.borderColor = colorBorder.cgColor
        self.layer.borderWidth = CGFloat(1)
        self.layer.cornerRadius = 15
        view.isHidden = isHidden
    }
    
    func setGradient(colorTop : CGColor, colorBottom : CGColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.masksToBounds = true
        self.layer.mask = mask
    }
}

