//
//  ForgetPassword+Valdation.swift
//  Halima
//
//  Created by Moustafa on 7/6/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension ForgetPasswordViewController  {
    //MARK: - Func to Validation of Login Text Field With Phone Is Empty Or Not
    
    func validateForgetPassword()->Bool {
        if   let phone = phoneTf.text   , !phone.isEmpty    {
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
            self.stopAnimating()
            return false
            
        }
    }
    
}
