//
//  Register+Valdation.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension RegisterViewController  {
    
    
    //MARK: - Func to Validation of Login Text Field With Phone Is Empty Or Not
    
    func validateRegister()->Bool {
        if  let name = nameTf.text  ,  let phone = phoneTf.text  , let email = emailTf.text , let password = passwordTf.text , let nationaly = nationalyTf.text , let userType = userType ,
            !name.isEmpty , !phone.isEmpty   , !password.isEmpty , !nationaly.isEmpty , !email.isEmpty{
            if name.count >= 3 {
                if emailIsValid(email){
                    if let countryId = countryId  , let numberCount = numberCount {
                        if phone.count == numberCount {
                            if nationaly.count >= 3 {
                                if valdateAddress() {
                                    if password.count >= 6 {
                                        if userType == 1 {
                                        return true
                                        }else{
                                            if valdateNurresyName() {
                                                return true
                                            }else{
                                                return false
                                            }
                                        }
                                    }else{
                                        passwordTf.becomeFirstResponder()
                                        Alert.show("Error".localized, massege: "Register7".localized, context: self)
                                        CustomDesign.validateNotDone(textField: passwordTf, revert: true)
                                        self.stopAnimating()
                                        return false
                                    }
                                }else{
                                    Alert.show("Error".localized, massege: "Register9".localized, context: self)
                                    self.stopAnimating()
                                    return false
                                }
                            }else{
                                nationalyTf.becomeFirstResponder()
                                Alert.show("Error".localized, massege: "Register6".localized, context: self)
                                CustomDesign.validateNotDone(textField: nationalyTf, revert: true)
                                self.stopAnimating()
                                return false
                            }
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
                }else{
                    emailTf.becomeFirstResponder()
                    Alert.show("Error".localized, massege: "Register3".localized, context: self)
                    CustomDesign.validateNotDone(textField: emailTf, revert: true)
                    self.stopAnimating()
                    return false
                }
            }else{
                nameTf.becomeFirstResponder()
                Alert.show("Error".localized, massege: "Register2".localized, context: self)
                self.stopAnimating()
                return false
            }
        }else {
            nameTf.becomeFirstResponder()
            Alert.show("Error".localized, massege: "Register1".localized, context: self)
            CustomDesign.validateNotDone(textField: nameTf, revert: true)
            CustomDesign.validateNotDone(textField: emailTf, revert: true)
            CustomDesign.validateNotDone(textField: phoneTf, revert: true)
            CustomDesign.validateNotDone(textField: nationalyTf, revert: true)
            CustomDesign.validateNotDone(textField: passwordTf, revert: true)
            self.stopAnimating()
            return false
        }
    }
    
    //MARK: - Func to Validation of Email
    
    func emailIsValid(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    func valdateAddress() -> Bool {
        if let lat = latitude , let lng = longitude  , let address = address{
            return true
        }else{
            return false
        }
    }
    
    
    func valdateNurresyName() -> Bool {
        if let nurresyName = nurresyNameTf.text , !nurresyName.isEmpty {
            if nurresyName.count  >= 3 {
                return true
        }else{
            nurresyNameTf.becomeFirstResponder()
            Alert.show("Error".localized, massege: "Register11".localized, context: self)
            CustomDesign.validateNotDone(textField: nurresyNameTf, revert: true)
            self.stopAnimating()
            return false
        }
        }else{
            nurresyNameTf.becomeFirstResponder()
            Alert.show("Error".localized, massege: "Register10".localized, context: self)
            CustomDesign.validateNotDone(textField: nurresyNameTf, revert: true)
            self.stopAnimating()
            return false
        }
    }
    
}
