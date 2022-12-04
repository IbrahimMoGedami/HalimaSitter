//
//  ValidationCode+Api.swift
//  Halima
//
//  Created by Moustafa on 7/6/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension ValidationCodeViewController : NVActivityIndicatorViewable   {
    
    
    
    
    //MARK: - Func to Get Verify Your Phone By Code
    
    func getValdationCode(){
        if validatCode() {
            self.startAnimating()
            let newCode = "\(codeTf1.text!)\(codeTf2.text!)\(codeTf3.text!)\(codeTf4.text!)"
            if let phone = phone , let countryId = countryId {
                Services.getCheckValidationCode(code: newCode, phone: phone, countryId: countryId,  callback: { [weak self] (result,stats)  in
                    guard let self = self else {return}
                    self.stopAnimating()
                    print(result)
                    print("stats code is \(stats)")
                    if  result.status == 1 {
                        self.register = result
                        self.clearText()
                        if let token = self.register?.data?.token {
                            UserDefault.setToken(token)
                            self.goToResetPassword()
                        }
                    }
                    if result.status == 0 {
                        Alert.show("Error".localized, massege: result.message ?? "", context: self)
                    }
                    
                }) { (error,stats) in
                    print("stats code is \(stats)")
                    self.stopAnimating()
                    print(error.localizedDescription)
                }
            }
        }
        
        
    }
    
    
    //MARK: - Func to Validation of Code  Text Field Is Empty Or No
    
    func validatCode()->Bool {
        if  let c1 = codeTf1.text, !c1.isEmpty , let c2 = codeTf2.text , !c2.isEmpty , let c3 = codeTf3.text , !c3.isEmpty , let c4 = codeTf4.text , !c4.isEmpty    {
            return true
        }else{
            codeTf1.becomeFirstResponder()
            Alert.show("Error".localized, massege: "ValidationCode1".localized, context: self)
            CustomDesign.validateNotDone(textField: codeTf1, revert: true)
            self.stopAnimating()
            return false
        }
        
    }
    
    
    
    
    
    
    //MARK: - Func to Empty TextFaild
    
    func clearText()  {
        codeTf1.text = ""
        codeTf2.text = ""
        codeTf3.text = ""
        codeTf4.text = ""
    }
    
    
    
    //    MARK: - Func to Get ForgetPassword
    
    func getForgetPasswordData(){
        if let phone = phone , let countryId = countryId {
            self.startAnimating()
            Services.getForgetPassword(phone: phone, countryId: countryId, callback: { [weak self] (result,stats)  in
                guard let self = self else {return}
                self.stopAnimating()
                print(result)
                print("stats code is \(stats)")
                if  result.status == 1 {
                    self.register = result
                    self.time  = 30
                    self.timeLbl.isHidden = false
                    self.resendCodeBtn.isHidden = true
                }else{
                    Alert.show("Error".localized, massege: result.message ?? "", context: self)
                }
                
            }) { (error,stats) in
                print("stats code is \(stats)")
                self.stopAnimating()
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
    
}

