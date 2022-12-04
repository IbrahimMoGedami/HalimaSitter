//
//  ResetPassword+Api.swift
//  Halima
//
//  Created by Moustafa on 7/6/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension ResetPasswordViewController : NVActivityIndicatorViewable   {
    
    
    
    //    MARK: - Func to Get ResetPassword

    func getResetPasswordData(){
        if validateResetPassword(){
        self.startAnimating()
            Services.getResetPassword(password: passwordTf.text!, passwordConfirm: confrimPasswordTf.text!, callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.register = result
                UserDefault.setcheckLogin(true)
                self.goToTabBarUserView()
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

