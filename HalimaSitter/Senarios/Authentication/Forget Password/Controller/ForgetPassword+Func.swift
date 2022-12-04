//
//  ForgetPassword+Func.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension ForgetPasswordViewController  {
  
    
    func updateDesign()  {
        setUpTableView()
        flagTableView.isHidden = true
        updateDesignLang()
        popupView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner  ]
        

    }
    
    func animate(toogle: Bool, type: UIButton) {
        
        if type == flagBtn {
            
            if toogle {
                UIView.animate(withDuration: 0.3) {
                    self.flagTableView.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.flagTableView.isHidden = true
                }
            }
            
        }
        
    }
    
   
    func goToValidationCode()  {
        let vc = AppStoryboard.ValidationCode.viewController(viewControllerClass: ValidationCodeViewController.self)
        vc.modalPresentationStyle = .overFullScreen
        if let phone = register?.data?.phone , let countryId = register?.data?.country?.id {
            vc.phone = phone
            vc.countryId = countryId
             present(vc, animated: true, completion: nil)
        }
    }
   
    func updateDesignLang()  {
        if MOLHLanguage.currentAppleLanguage() == "en"{
            phoneTf.textAlignment = .left
        }
        else if  MOLHLanguage.currentAppleLanguage() == "ar"{
            phoneTf.textAlignment = .right
        }
    }
    
}
