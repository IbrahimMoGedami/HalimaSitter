//
//  Menu+Api.swift
//  Halima
//
//  Created by Moustafa on 7/16/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import ImageSlideshow
import GooglePlaces
import GoogleMaps
extension MenuViewController : NVActivityIndicatorViewable   {
    
    
    
    //    MARK: - Func to Get LogOut
    
    func getLogOut(){
        self.startAnimating()
        Services.getLogOut(  callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.register = result
                UserDefault.setcheckLogin(false)
                self.destoryDataInUserDeafult()
                self.goToLogin()
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
        
        
        
    }
    
    func destoryDataInUserDeafult()  {
       
        UserDefault.setName("")
        UserDefault.setEmail("")
        UserDefault.setAddress("")
        UserDefault.setPhone("")
        UserDefault.setIdNumber("")
        UserDefault.setToken("")
        UserDefault.setCountryCode("")
        UserDefault.setCountryFlag("")
        UserDefault.setcheckLogin(false)
        
    }
    
    
    //    MARK: - Func to Change Language
    
    func getChangeLang(lang : String){
        self.startAnimating()
        Services.changeLangauage(lang: lang, callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.register = result
                MOLH.setLanguageTo(lang)
                MOLH.reset()
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
        
    }
    
    
    
}
