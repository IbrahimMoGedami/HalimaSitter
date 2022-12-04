//
//  Register+Func.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension RegisterViewController   {
  
    
    func updateDesign()  {
        setUpTableView()
        flagTableView.isHidden = true
        updateDesignLang()
        phoneTf.attributedPlaceholder = NSAttributedString(string: "Phone".localized,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        nameTf.attributedPlaceholder = NSAttributedString(string: "Name".localized,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        emailTf.attributedPlaceholder = NSAttributedString(string: "Email".localized,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        nationalyTf.attributedPlaceholder = NSAttributedString(string: "Nationality".localized,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        passwordTf.attributedPlaceholder = NSAttributedString(string: "Password".localized,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        nurresyNameTf.attributedPlaceholder = NSAttributedString(string: "NurseryName".localized,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        addressTf.attributedPlaceholder = NSAttributedString(string: "Address".localized,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        scrollView.contentInsetAdjustmentBehavior = .never
        bodyView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner  ]
        passwordTf.clipsToBounds = true
        nameTf.clipsToBounds = true
        emailTf.clipsToBounds = true
        nationalyTf.clipsToBounds = true
        nurresyNameTf.clipsToBounds = true
        addressTf.clipsToBounds = true
        if let userType = userType {
            if userType == 1 {
                nurresyNameTf.isHidden = true
            }else if userType == 2 {
                nurresyNameTf.isHidden = false
            }
        }

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
    
   
    func goToCompleteRegister(){
        let vc = AppStoryboard.CompleteRegister.viewController(viewControllerClass: CompleteRegisterViewController.self)
        vc.modalPresentationStyle = .fullScreen
        if let userType = userType {
            vc.userType = userType
            navigationController?.pushViewController(vc, animated: true)

        }
        
    }
    
    func goToConfrimAddressView()  {
        let vc = AppStoryboard.ConfrimAddress.viewController(viewControllerClass: ConfrimAddressViewController.self)
        vc.modalPresentationStyle = .fullScreen
        vc.locationData = self
        navigationController?.pushViewController(vc, animated: true)
    }
   
    func updateDesignLang()  {
        if MOLHLanguage.currentAppleLanguage() == "en"{
            nameTf.textAlignment = .left
            emailTf.textAlignment = .left
            phoneTf.textAlignment = .left
            nationalyTf.textAlignment = .left
            passwordTf.textAlignment = .left
            nurresyNameTf.textAlignment = .left
            addressTf.textAlignment = .left
        }
        else if  MOLHLanguage.currentAppleLanguage() == "ar"{
            nameTf.textAlignment = .right
            emailTf.textAlignment = .right
            phoneTf.textAlignment = .right
            nationalyTf.textAlignment = .right
            passwordTf.textAlignment = .right
            nurresyNameTf.textAlignment = .right
            addressTf.textAlignment = .right
        }
    }
    
    
    //MARK: - Func to Empty TextFaild
    
    func clearText()  {
        nameTf.text = ""
        emailTf.text = ""
        nationalyTf.text = ""
        phoneTf.text = ""
        passwordTf.text = ""
        nurresyNameTf.text = ""
        addressTf.text = ""
        latitude = nil
        longitude = nil
        address = nil
        
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
    
    func goToTabBarUserView()  {
//        let vc = AppStoryboard.Tab.viewController(viewControllerClass: ParentTabBarViewController.self)
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
    }
    
}
