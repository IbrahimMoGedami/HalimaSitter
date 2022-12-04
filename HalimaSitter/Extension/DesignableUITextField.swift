//
//  DesignableTextField.swift
//  HatleyOriginal
//
//  Created by Apple on 10/9/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableUITextField: UITextField {
    // Provides left padding for images

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {

       var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x += rightPadding
        return textRect
    }

    
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateViewLeft()
        }
    }

    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateViewRight()
    
}
    }

    
    
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var rightPadding: CGFloat = 0
   

    
    @IBInspectable var color: UIColor = UIColor.darkGray {
        didSet {
            updateViewLeft()
            updateViewRight()
        }
    }
    
    
    func updateViewLeft() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let ImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            ImageView.contentMode = .scaleToFill
            ImageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            ImageView.tintColor = color
            leftView = ImageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
        func updateViewRight() {
       if let image = rightImage {
           rightViewMode = UITextField.ViewMode.always
           let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
           imageView.contentMode = .scaleAspectFit
          imageView.image = image
          // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
           imageView.tintColor = color
            rightView = imageView
       } else {
           rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}
