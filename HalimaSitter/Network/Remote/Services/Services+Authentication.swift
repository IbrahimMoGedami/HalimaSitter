//
//  Services+Authentication.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit
import Alamofire
import MOLH

class Services {
    
}
extension Services {
    
    //  MARK: - Register

    class func getRegister(name : String  , phone : String ,countryId  : Int   ,email : String , fireBase : String , nationality : String , password : String ,  type : Int , nurseryName : String , lat : Double , lng : Double , address : String , callback: @escaping (Register , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.register
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["username": name  ,  "phone" : phone , "country_id" : countryId , "email" : email , "nationality" : nationality , "password" : password , "fire_base" : fireBase  , "type" : type , "nursery_name" : nurseryName , "lat" : lat , "lng" : lng , "address" : address ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: Register ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Login

    class func getLogin(phone : String ,password : String ,  countryId : Int  , fireBase : String ,  callback: @escaping (Register , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.login
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["phone": phone , "password" : password , "country_id" : countryId , "fire_base" : fireBase ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: Register ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    // MARK: - ChangePassword
    class func changePassword(newPassword :String , oldPassword : String ,  callback: @escaping (Register , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.changePassword
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["newPassword" : newPassword , "oldPassword": oldPassword ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers: headers, callBack: { (response: Register ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    //  MARK: - ForgetPassword

    class func getForgetPassword(phone : String ,  countryId : Int  ,   callback: @escaping (Register , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.forgetPassword
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["phone": phone ,  "country_id" : countryId ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: Register ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Validation Code

    class func getCheckValidationCode(code :String , phone : String ,  countryId : Int  ,   callback: @escaping (Register , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.validationCode
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["code" : code , "phone": phone ,  "country_id" : countryId ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: Register ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Reset Password

    class func getResetPassword(password :String , passwordConfirm : String ,  callback: @escaping (Register , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.resetPassword
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["password" : password , "password_confirm": passwordConfirm ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: Register ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    // MARK: - Countries
    
    class func getCountries( callback: @escaping (Countries , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.countries
        let headers: HTTPHeaders = ["Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:headers, callBack: { (response: Countries ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Complete register

    
    class func getCompleteRegister(residency : Any , lease : Any   , profilImage : Any  , taxCard : Any , commercialRegister : Any,certificatesImages : [UIImage] , certificatesFiles : [Data]  ,    callback: @escaping (Register) -> Void, failureHandler: @escaping (Error) -> Void)  {
        let jsonDecodeer = JSONDecoder()
        
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        AF.upload(multipartFormData: {(form: MultipartFormData) in
            
            if let lease = lease as? UIImage{
                if let data = lease.jpegData(compressionQuality: 0.5){
                    form.append(data, withName: "lease",fileName: "photo.jpeg",mimeType: "image/jpeg")
                }
            }else {
                if let lease = lease as? Data{
                form.append(lease, withName: "lease", fileName: "name.pdf", mimeType:"application/pdf")
                }

            }
            
            if let residency = residency as? UIImage{
                if let data = residency.jpegData(compressionQuality: 0.5){
                    form.append(data, withName: "residency",fileName: "photo.jpeg",mimeType: "image/jpeg")
                }
            }else {
                if let residency = residency as? Data{
                form.append(residency, withName: "residency", fileName: "name.pdf", mimeType:"application/pdf")
                }

            }
            
            if let profilImage = profilImage as? UIImage{
                if let data = profilImage.jpegData(compressionQuality: 0.5){
                    form.append(data, withName: "image",fileName: "photo.jpeg",mimeType: "image/jpeg")
                }
            }else {
                if let profilImage = profilImage as? Data{
                form.append(profilImage, withName: "image", fileName: "name.pdf", mimeType:"application/pdf")
                }

            }
           
            if let taxCard = taxCard as? UIImage{
                if let data = taxCard.jpegData(compressionQuality: 0.5){
                    form.append(data, withName: "tax_card",fileName: "photo.jpeg",mimeType: "image/jpeg")
                }
            }else {
                if let taxCard = taxCard as? Data{
                form.append(taxCard, withName: "tax_card", fileName: "name.pdf", mimeType:"application/pdf")
                }

            }
            
            if let commercialRegister = commercialRegister as? UIImage{
                if let data = commercialRegister.jpegData(compressionQuality: 0.5){
                    form.append(data, withName: "commercial_register",fileName: "photo.jpeg",mimeType: "image/jpeg")
                }
                
            }else {
                if let commercialRegister = commercialRegister as? Data{
                form.append(commercialRegister, withName: "commercial_register", fileName: "name.pdf", mimeType:"application/pdf")
                }

            }
            
            let  number : Int = (certificatesImages.count )
            print(number)
            for i in 0..<number{
                print(i)
                if let data = certificatesImages[i].jpegData(compressionQuality: 0.5){
                    form.append(data, withName: "ExperienceCertificatesImages[]",fileName: "photo.jpeg",mimeType: "image/jpeg")
                    print(data)
                }
            }
            let  fileNumber : Int = (certificatesFiles.count )
            print(number)
            for i in 0..<fileNumber{
                print(i)
                form.append(certificatesFiles[i], withName: "ExperienceCertificatesfiless[]", fileName: "name.pdf", mimeType:"application/pdf")
            }
            
        }, to: URLs.completeRegister, usingThreshold: MultipartFormData.encodingMemoryThreshold, method: .post, headers: headers).responseJSON { (response) in
                        switch response.result {
            case .success:
                if let _ = response.data {
                    guard let resultData = response.data else { fatalError() }
                    do {
                        let basicResponse = try jsonDecodeer.decode(Register.self, from: resultData)
                        callback(basicResponse)
                    }
                    catch(let error) {
                        failureHandler(error)
                    }
                }
            case .failure(let error):
                failureHandler(error)
            }
        }
        
    }
    
}
