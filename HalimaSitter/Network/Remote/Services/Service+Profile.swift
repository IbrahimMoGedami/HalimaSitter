//
//  Service+Profile.swift
//  Halima
//
//  Created by Moustafa on 7/14/21.
//

import UIKit
import Alamofire
import MOLH


extension Services {
    
    
    //  MARK: - My Info
    
    class func getMyInfo( callback: @escaping (Register , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.profileData
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:headers, callBack: { (response: Register ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Edit Profile

    
    class func getEditProfile(name : String  , phone : String ,countryId  : Int   ,email : String , gender : Int , nationality : String , moneyRate : String , aboutSitter : String , nurseryName : String ,  image : UIImage ,callback: @escaping (Register) -> Void, failureHandler: @escaping (Error) -> Void)  {
        let jsonDecodeer = JSONDecoder()
        
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        AF.upload(multipartFormData: {(form: MultipartFormData) in
            if let data = image.jpegData(compressionQuality: 0.5){
                form.append(data, withName: "image",fileName: "photo.jpeg",mimeType: "image/jpeg")
            }
            form.append(Data(name.utf8),withName: "username")
            form.append(Data(phone.utf8),withName: "phone")
            form.append(Data(String(countryId).utf8),withName: "country_id")
            form.append(Data(email.utf8),withName: "email")
            form.append(Data(String(gender).utf8),withName: "gender")
            form.append(Data(nationality.utf8),withName: "nationality")
            form.append(Data(moneyRate.utf8),withName: "moneyRate")
            form.append(Data(aboutSitter.utf8),withName: "aboutSitter")
            form.append(Data(nurseryName.utf8),withName: "nursery_name")

            
            
        }, to: URLs.editProfile, usingThreshold: MultipartFormData.encodingMemoryThreshold, method: .post, headers: headers).responseJSON { (response) in
            
            //    print(response.result.value)
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
    
    
    //  MARK: - Rooms
    
    class func getRooms( callback: @escaping (Rooms , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.Rooms
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:headers, callBack: { (response: Rooms ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    
    //  MARK: - Delete Room
    
    class func getDeleteRoom( id : Int ,  callback: @escaping (Rooms , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.deleteRoom
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["id": id  ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: Rooms ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Add Room

    
    class func getAddRoom(name : String ,  image : [UIImage] ,callback: @escaping (SingleRoom) -> Void, failureHandler: @escaping (Error) -> Void)  {
        let jsonDecodeer = JSONDecoder()
        
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        AF.upload(multipartFormData: {(form: MultipartFormData) in
            let  number : Int = (image.count )
            print(number)
            for i in 0..<number{
                print(i)
                if let data = image[i].jpegData(compressionQuality: 0.5){
                    form.append(data, withName: "images[]",fileName: "photo.jpeg",mimeType: "image/jpeg")
                    print(data)
                }
            }
            form.append(Data(name.utf8),withName: "name")
           

            
            
        }, to: URLs.addRoom, usingThreshold: MultipartFormData.encodingMemoryThreshold, method: .post, headers: headers).responseJSON { (response) in
            
            //    print(response.result.value)
            switch response.result {
            case .success:
                if let _ = response.data {
                    guard let resultData = response.data else { fatalError() }
                    do {
                        let basicResponse = try jsonDecodeer.decode(SingleRoom.self, from: resultData)
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
    
    
    //  MARK: - BabySiter
    
    class func getBabySiters( callback: @escaping (BabySiters , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.BabySiters
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:headers, callBack: { (response: BabySiters ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    
    //  MARK: - Delete BabySiter
    
    class func getDeleteBabySiter( id : Int ,  callback: @escaping (BabySiters , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.deletebabySiter
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["id": id  ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: BabySiters ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
    
    //  MARK: - Add BabySiter
    
    class func getAddBabySiter( name : String , degree : String ,  callback: @escaping (SingleBabySiter , Int) -> Void, failureHandler: @escaping (Error ,Int) -> Void) {
        let url = URLs.addBabySiter
        let headers: HTTPHeaders = [ "Authorization" : ("Bearer \(UserDefault.getToken())") , "lang": MOLHLanguage.currentAppleLanguage()]
        let parameters = ["name": name  , "degree" : degree ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:headers, callBack: { (response: SingleBabySiter ,Int) in
            callback(response ,Int)
        }) { (error , Int)  in
            failureHandler(error,Int)
        }
    }
}
