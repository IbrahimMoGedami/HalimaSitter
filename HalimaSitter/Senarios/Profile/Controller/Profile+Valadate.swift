//
//  Profile+Valadate.swift
//  Halima
//
//  Created by Moustafa on 7/15/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension ProfileViewController  {
    
    
    //MARK: - Func to Validation of Login Text Field With Phone Is Empty Or Not
    
    func validateEditProfile()->Bool {
        if  let name = nameTf.text  ,  let phone = phoneTf.text  , let email = emailTf.text , let nationaly = nationalyTf.text , let price = servicePriceTf.text ,
            !name.isEmpty , !phone.isEmpty  , !nationaly.isEmpty , !email.isEmpty , !price.isEmpty {
            if name.count >= 3 {
                if emailIsValid(email){
                    if let countryId = countryId  , let numberCount = numberCount {
                        if phone.count == numberCount {
                            if nationaly.count >= 3 {
                                if let userType = register?.data?.type {
                                    if userType == 1 {
                                        return true
                                    }else if valdateNurresyName() {
                                        return true
                                    }else{
                                        return false
                                    }
                                }else{
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
            CustomDesign.validateNotDone(textField: servicePriceTf, revert: true)
            
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
    
    
    func valdateNurresyName() -> Bool {
        if let nurresyName = nurseyNameTf.text , !nurresyName.isEmpty {
            if nurresyName.count  >= 3 {
                return true
            }else{
                nurseyNameTf.becomeFirstResponder()
                Alert.show("Error".localized, massege: "Register11".localized, context: self)
                CustomDesign.validateNotDone(textField: nurseyNameTf, revert: true)
                self.stopAnimating()
                return false
            }
        }else{
            nurseyNameTf.becomeFirstResponder()
            Alert.show("Error".localized, massege: "Register10".localized, context: self)
            CustomDesign.validateNotDone(textField: nurseyNameTf, revert: true)
            self.stopAnimating()
            return false
        }
    }
    
    
}
