//
//  Service+ChatAndNoti.swift
//  Halima
//
//  Created by Moustafa on 7/17/21.
//

import UIKit
import Alamofire
import MOLH


extension Services {
    
    //  MARK: - My Chat

    class func getMyChat(id : Int , callback: @escaping (ParentMessages , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.chat
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["id": id ]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: parameters, headers:headers, callBack: { (response: ParentMessages ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - My Notification
    
    class func getMyNotification(callback: @escaping (MyNotification , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.notification
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:headers, callBack: { (response: MyNotification ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
   
    
   
    
}
