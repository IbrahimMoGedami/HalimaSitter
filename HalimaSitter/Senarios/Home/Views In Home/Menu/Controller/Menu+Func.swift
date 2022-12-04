//
//  Menu+Func.swift
//  Halima
//
//  Created by Moustafa on 7/8/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension MenuViewController  {
    
   
    
    func goToOAbout()  {
        let vc = AppStoryboard.About.viewController(viewControllerClass: AboutUsViewController.self)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    //  MARK: - Func to go to change password
    
    func goToChagePassword() {
        let vc = AppStoryboard.ChangePassword.viewController(viewControllerClass: ChangePasswordViewController.self)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func goToPrivacyPolicy()  {
        let vc = AppStoryboard.PrivacyPolicy.viewController(viewControllerClass: PrivacyPolicyViewController.self)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToLogin()  {
        if  let vc = storyboard?.instantiateViewController(withIdentifier: "Login")  {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    func changeLanguage(){
        if MOLHLanguage.currentAppleLanguage() == "ar" {
            getChangeLang(lang: "en")
        }else{
            getChangeLang(lang: "ar")
        }
    }
    
}
  
