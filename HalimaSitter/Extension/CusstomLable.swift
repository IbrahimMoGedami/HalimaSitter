//
//  CusstomLable.swift
//  FixMe
//
//  Created by Moustafa on 10/12/20.
//

import UIKit

class CusstomLable: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUiview()
    }
    
    func setUpUiview()  {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        

    }
}
