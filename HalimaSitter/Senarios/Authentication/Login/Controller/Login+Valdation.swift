//
//  Login+Valdation.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension LoginViewController  {
    
    
    //MARK: - Func to Validation of Login Text Field With Phone Is Empty Or Not
    
    func validateLogin()->Bool {
        if   let phone = phoneTf.text  , let password = passwordTf.text  , !phone.isEmpty   , !password.isEmpty {
            if let countryId = countryId  , let numberCount = numberCount {
                if phone.count == numberCount {
                    
                    return true
                    
                }else{
                    phoneTf.becomeFirstResponder()
                    Alert.show("Error".localized, massege: "\("Register5".localized)\(numberCount)", context: self)
                    CustomDesign.validateNotDone(textField: phoneTf, revert: true)
                    self.stopAnimating()
                    return false
                }
            }else{
                phoneTf.becomeFirstResponder()
                Alert.show("Error".localized, massege: "Register4".localized, context: self)
                CustomDesign.validateNotDone(textField: phoneTf, revert: true)
                self.stopAnimating()
                return false
            }
        }else {
            phoneTf.becomeFirstResponder()
            Alert.show("Error".localized, massege: "Register1".localized, context: self)
            CustomDesign.validateNotDone(textField: phoneTf, revert: true)
            CustomDesign.validateNotDone(textField: passwordTf, revert: true)
            self.stopAnimating()
            return false
            
          //  AlertView.instance.showAlert(title: "Success", message: "You are succesfully loged into the system.", alertType: .success)

          //  return false
        }
    }
    
    
    
    
}
