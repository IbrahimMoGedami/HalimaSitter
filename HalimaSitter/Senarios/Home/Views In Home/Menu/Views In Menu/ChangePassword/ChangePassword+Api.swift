//
//  ChangePassword+Api.swift
//  HalimaSitter
//
//  Created by Sameh Sengab on 06/11/2022.
//

import Foundation
import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension ChangePasswordViewController : NVActivityIndicatorViewable   {
    
    
    
    //    MARK: - Func to Get ResetPassword
    
    func changePasswordData() {
        self.startAnimating()
        Services.changePassword(newPassword: newPasswordTextField.text ?? "", oldPassword: oldPasswordTextField.text ?? "") { [weak self] result, stats in
            guard let self = self else { return }
            self.stopAnimating()
            print(result)
            print("status code is\(stats)")
            if  result.status == 1 {
                Alert.show("تم تعديل كلمه المرور", massege: result.message ?? "", context: self)
                self.goToTabBarUserView()
            }else{
                Alert.show("Error".localized, massege: result.message ?? "", context: self)}
        } failureHandler: { (error, stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
    }
}
