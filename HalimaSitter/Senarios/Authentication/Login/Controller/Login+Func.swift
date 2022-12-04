//
//  Login+Func.swift
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
  
    
    func updateDesign()  {
        setUpTableView()
        flagTableView.isHidden = true
        updateDesignLang()
        bodyView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner  ]
        scrollView.contentInsetAdjustmentBehavior = .never
        passwordTf.clipsToBounds = true

    }
    
    func animate(toogle: Bool, type: UIButton) {
        
        if type == flagBtn {
            
            if toogle {
                UIView.animate(withDuration: 0.3) {
                    self.flagTableView.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.flagTableView.isHidden = true
                }
            }
            
        }
        
    }
    
   
    func goToUserType(){
        let vc = AppStoryboard.UserType.viewController(viewControllerClass: UserTypeViewController.self)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToForgetPassword()  {
        let vc = AppStoryboard.ForgetPassword.viewController(viewControllerClass: ForgetPasswordViewController.self)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
   
    func goToTabBarUserView()  {
        let vc = AppStoryboard.Tab.viewController(viewControllerClass: NurseryTabBarViewController.self)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
   
    
    func updateDesignLang()  {
        if MOLHLanguage.currentAppleLanguage() == "en"{
            phoneTf.textAlignment = .left
            passwordTf.textAlignment = .left
        }
        else if  MOLHLanguage.currentAppleLanguage() == "ar"{
            phoneTf.textAlignment = .right
            passwordTf.textAlignment = .right

        }
    }
    
    //MARK: - Func to Save Data In User Deafult
    
    func saveDataInUserDeafults()  {
        
        if let id = register?.data?.id {
            UserDefault.setId(id)
        }
        if let name = register?.data?.username {
            UserDefault.setName(name)
        }
        if let email = register?.data?.email {
            UserDefault.setEmail(email)
        }
        if let phone = register?.data?.phone {
            UserDefault.setPhone(phone)
        }
        if let countryCode = register?.data?.country?.phoneKey {
            UserDefault.setCountryCode(countryCode)
        }
        if let numCount = register?.data?.country?.phoneNum {
            UserDefault.setNumCount(numCount)
        }
        if let token = register?.data?.token {
            UserDefault.setToken(token)
        }


        
    }
    
        //MARK: - Func to Empty TextFaild
    
        func clearText()  {
    
            phoneTf.text = ""
            passwordTf.text = ""
    
        }
    
    
    func whatAfterLogin(){
        if let stats = register?.data?.status {
            switch stats {
            case 0:
                goToCompleteRegister()
            case 1:
                goToTabBarUserView()
            case 2:
                goToWating()
            default:
                print("xx")
            }
        }
    }
    
    func goToCompleteRegister(){
        let vc = AppStoryboard.CompleteRegister.viewController(viewControllerClass: CompleteRegisterViewController.self)
        vc.modalPresentationStyle = .fullScreen
        if let userType = register?.data?.type {
            vc.userType = userType
            navigationController?.pushViewController(vc, animated: true)

        }
        
    }
    
    func goToWating()  {
        let vc = AppStoryboard.WaitToAccpeted.viewController(viewControllerClass: WatingToAccpetedViewController.self)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
}
