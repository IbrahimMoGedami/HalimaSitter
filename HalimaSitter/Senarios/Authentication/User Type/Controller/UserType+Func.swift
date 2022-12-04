//
//  UserType+Func.swift
//  HalimaSitter
//
//  Created by Moustafa on 02/08/2021.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension UserTypeViewController  {
  
    
    func updateDesign()  {
      
        scrollView.contentInsetAdjustmentBehavior = .never
        bodyView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner  ]
    }
    
    func goToRegister(userType : Int){
        let vc = AppStoryboard.Register.viewController(viewControllerClass: RegisterViewController.self)
        vc.modalPresentationStyle = .fullScreen
        vc.userType = userType
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
