//
//  ResetPasssword+Func.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension ResetPasswordViewController  {
  
    func updateDesign(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tabToClosePopup))
        bigView.addGestureRecognizer(tapGesture)
        updateDesignLang()
        passwordTf.clipsToBounds = true
        confrimPasswordTf.clipsToBounds = true
        
    }
    
    
    @objc func tabToClosePopup()  {
        dismiss(animated: true, completion: nil)
    }
    
    func updateDesignLang()  {
        if MOLHLanguage.currentAppleLanguage() == "en"{
            passwordTf.textAlignment = .left
            confrimPasswordTf.textAlignment = .left
                    
        }
        else if  MOLHLanguage.currentAppleLanguage() == "ar"{
            passwordTf.textAlignment = .right
            confrimPasswordTf.textAlignment = .right
           
        }
    }
    
    
    func goToTabBarUserView()  {
//        let vc = AppStoryboard.Tab.viewController(viewControllerClass: ParentTabBarViewController.self)
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
    }
    
}
