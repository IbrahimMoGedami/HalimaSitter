//
//  CardCusstomView.swift
//  HappyTimes
//
//  Created by mountasher on 6/10/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit

class CardCusstomView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUiview()
    }
    
    
    func setUpUiview()  {
        self.layer.cornerRadius = 8
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize()
        self.layer.shadowOpacity = 0.5
    }

   
}


