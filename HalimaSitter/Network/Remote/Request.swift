//
//  Request.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit
import Alamofire

class Service {

   class func request<T: Codable>(url: String, dateFormate: String?, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?,
                                  callBack:@escaping (T,Int) -> Void,
                                  failureHandler:@escaping (Error,Int) -> Void) {
       
       let jsonDecodeer = JSONDecoder()
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = dateFormate
       jsonDecodeer.dateDecodingStrategy = .formatted(dateFormatter)
       
       
       print(url)
       print(parameters)
       URLCache.shared.removeAllCachedResponses()

       //        print(headers)
       AF.request(url, method: method, parameters: parameters, headers: headers).validate().responseJSON { (response) in

           //    print(response.result.value)
           switch response.result {
           case .success:
               if let _ = response.data {
                   guard let resultData = response.data else { fatalError() }
                   do {
                       let basicResponse = try jsonDecodeer.decode(T.self, from: resultData)
                       callBack(basicResponse, response.response?.statusCode ?? 0)
                   }
                   catch(let error) {
                       failureHandler(error, response.response?.statusCode ?? 0)
                   }
               }
           case .failure(let error):
               failureHandler(error, response.response?.statusCode ?? 0)
           }
       }
       
   }
   


}



