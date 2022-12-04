//
//  Services+Home.swift
//  Halima
//
//  Created by Moustafa on 7/12/21.
//

import UIKit
import Alamofire
import MOLH


extension Services {
    
    //  MARK: - My Orders
    
    class func getMyOrders( callback: @escaping (MyOrders , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.myOrders
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:headers, callBack: { (response: MyOrders ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Change Stats
    
    class func getMyChangeStats( orderId : Int , status : Int , callback: @escaping (ChangeStats , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.changeStats
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["order_id": orderId , "status" : status ]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: ChangeStats ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - User Rate
    
    class func getMyUserRate( id : Int  , callback: @escaping (UserRate , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.userRate
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["user_id": id ]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: parameters, headers:headers, callBack: { (response: UserRate ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Add Rate And Comment
    
    class func getAddRateAndComment(userId : Int , rate : Int, comment : String , callback: @escaping (ChangeStats , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.addRate
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["user_id": userId ,  "rate" : rate , "comment" : comment ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: ChangeStats ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
   
}
