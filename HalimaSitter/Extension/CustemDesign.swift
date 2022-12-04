//
//  CustemDesign.swift
//  Dr.Nour
//
//  Created by Mustafa on 12/15/19.
//  Copyright © 2019 begroup. All rights reserved.
//

import UIKit
class CustomDesign {
    
    
    static func cricleViewDesign(view : UIView) {
        view.layer.cornerRadius = view.frame.size.height/2
        
    }
    
    static func customViewTextFaild(view : UIView) {
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 0.3
        view.clipsToBounds = true
    }
    static func customTextFaild(textField : UITextField) {
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.3
        textField.clipsToBounds = true
    }
    static func customCircleImage(image : UIImageView) {
        image.layer.cornerRadius = image.frame.size.height/2
        image.layer.borderWidth = 0.3
        image.clipsToBounds = true
    }
    
    static func cricleButtonDesign(btn  : UIButton) {
        btn.layer.cornerRadius = btn.frame.size.height/2
        btn.clipsToBounds = true
        
    }
    static func criclLableDesign(lable  : UILabel) {
        lable.layer.cornerRadius = lable.frame.size.height/2
        lable.clipsToBounds = true
        
    }
    
    static func cusstomLableDesign(lable  : UILabel) {
        lable.layer.cornerRadius = 5
        lable.clipsToBounds = true
        
    }
    
    
    static func validateNotDone(textField : UITextField , revert: Bool) {
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = 3
        if revert { shake.autoreverses = true } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
        textField.layer.add(shake, forKey: "position")
    }
    
    static func validateTf(textField : DesignableUITextField  , image : String) {
        textField.rightImage = UIImage(named: image)
    }
    
    
    
    
}
