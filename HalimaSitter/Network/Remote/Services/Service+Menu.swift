//
//  Service+Menu.swift
//  Halima
//
//  Created by Moustafa on 7/16/21.
//

import UIKit
import Alamofire
import MOLH


extension Services {
    
    
    //  MARK: - LogOut

    class func getLogOut(  callback: @escaping (Register , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.logOut
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: nil, headers:headers, callBack: { (response: Register ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    // MARK: - Change Langauage
    
    class func changeLangauage(lang: String  ,  callback: @escaping (Register , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.changeLang
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["lang": lang ]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: Register ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    
    //  MARK: - Setting

    class func getSettings(  callback: @escaping (Settings , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.setting
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:headers, callBack: { (response: Settings ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
  
}
