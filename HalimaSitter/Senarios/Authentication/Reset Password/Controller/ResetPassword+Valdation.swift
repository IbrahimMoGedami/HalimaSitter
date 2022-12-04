//
//  ResetPassword+Valdation.swift
//  Halima
//
//  Created by Moustafa on 7/6/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension ResetPasswordViewController  {
    
    
    //MARK: - Func to Validation of Login Text Field With Phone Is Empty Or Not
    
    func validateResetPassword()->Bool {
        if  let password = passwordTf.text , let passwordConfrim = confrimPasswordTf.text ,
            !password.isEmpty , !passwordConfrim.isEmpty {
            if password.count >= 6 {
                    if password == passwordConfrim {
                        return true
                    }else{
                        passwordTf.becomeFirstResponder()
                        Alert.show("Error".localized, massege: "ResetPassword3".localized, context: self)
                        CustomDesign.validateNotDone(textField: passwordTf, revert: true)
                        self.stopAnimating()
                        return false
                    }
            }else{
                passwordTf.becomeFirstResponder()
                Alert.show("Error".localized, massege: "ResetPassword2".localized, context: self)
                CustomDesign.validateNotDone(textField: passwordTf, revert: true)
                self.stopAnimating()
                return false
            }
            
        }else {
            passwordTf.becomeFirstResponder()
            Alert.show("Error".localized, massege: "ResetPassword1".localized, context: self)
            CustomDesign.validateNotDone(textField: passwordTf, revert: true)
            CustomDesign.validateNotDone(textField: confrimPasswordTf, revert: true)
            self.stopAnimating()
            return false
        }
    }
    
    
    
}
