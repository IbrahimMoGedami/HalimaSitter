//
//  ChangePassword+Func.swift
//  HalimaSitter
//
//  Created by Sameh Sengab on 06/11/2022.
//

import Foundation
import Foundation
import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension ChangePasswordViewController  {
  
    func updateDesign() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tabToClosePopup))
        bigView.addGestureRecognizer(tapGesture)
        updateDesignLang()
        newPasswordTextField.clipsToBounds = true
        oldPasswordTextField.clipsToBounds = true
        
    }
    
    
    @objc func tabToClosePopup()  {
        dismiss(animated: true, completion: nil)
    }
    
    func updateDesignLang()  {
        if MOLHLanguage.currentAppleLanguage() == "en"{
            newPasswordTextField.textAlignment = .left
            oldPasswordTextField.textAlignment = .left
                    
        }
        else if  MOLHLanguage.currentAppleLanguage() == "ar"{
            newPasswordTextField.textAlignment = .right
            oldPasswordTextField.textAlignment = .right
           
        }
    }
    
    
    func goToTabBarUserView()  {
       dismiss(animated: true)
    }
    
}
