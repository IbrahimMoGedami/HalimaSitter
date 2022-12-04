//
//  CardCusstomTextField.swift
//  HappyTimes
//
//  Created by Moustafa on 11/23/20.
//

import UIKit

class CardCusstomTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUiview()
    }
    
    func setUpUiview()  {
        self.layer.cornerRadius = 5
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize()
        self.layer.shadowOpacity = 0.5

    }
    

}
