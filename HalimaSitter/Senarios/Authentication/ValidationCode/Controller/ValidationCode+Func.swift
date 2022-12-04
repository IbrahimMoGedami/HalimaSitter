//
//  ValidationCode+Func.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension ValidationCodeViewController  {
  
    func updateDesign(){
        codeTf1.delegate = self
        codeTf2.delegate = self
        codeTf3.delegate = self
        codeTf4.delegate = self
        codeTf1.becomeFirstResponder()
        codeTf1.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        codeTf2.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        codeTf3.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        codeTf4.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tabToClosePopup))
        bigView.addGestureRecognizer(tapGesture)
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        resendCodeBtn.isHidden = true
        codeTf1.clipsToBounds = true
        codeTf2.clipsToBounds = true
        codeTf3.clipsToBounds = true
        codeTf4.clipsToBounds = true

        
    }
    
    
    @objc func tabToClosePopup()  {
        dismiss(animated: true, completion: nil)
    }
    
    func updateDesignLang()  {
        if MOLHLanguage.currentAppleLanguage() == "en"{
            codeTf1.textAlignment = .left
            codeTf2.textAlignment = .left
            codeTf3.textAlignment = .left
            codeTf4.textAlignment = .left
                    
        }
        else if  MOLHLanguage.currentAppleLanguage() == "ar"{
            codeTf1.textAlignment = .right
            codeTf2.textAlignment = .right
            codeTf3.textAlignment = .right
            codeTf4.textAlignment = .right
        }
    }
    
    
    
    
    @objc func updateCounter() {
        //example functionality
        if time > 0 {
            timeLbl.text = "\("ValidationCode2".localized) \(time) \("ValidationCode3".localized)"
            print("\(time) seconds to the end of the world")
            time -= 1
        }else {
            timeLbl.isHidden = true
            resendCodeBtn.isHidden = false

        }
    }
    
    func goToResetPassword()  {
        let vc = AppStoryboard.ResetPassword.viewController(viewControllerClass: ResetPasswordViewController.self)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
}
