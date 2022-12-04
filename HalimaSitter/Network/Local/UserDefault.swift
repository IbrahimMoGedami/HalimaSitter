//
//  UserDefault.swift
//  Dr.Booking
//
//  Created by Mustafa on 11/13/19.
//  Copyright © 2019 BeSolutions.Dr.BookingOriginal. All rights reserved.
//

import Foundation

struct UserDefault {
    
    static let id =  "id"
    static let name = "name"
    static let email = "email"
    static let address = "address"
    static let idNumber = "idNumber"
    static let phone = "phone"
    static let image = "image"
    static let countryCode = "countryCode"
    static let numCount =  "numCount"
    static let countryId =  "countryId"
    static let countryFlag = "countryFlag"
    static let token = "token"
    static var checkLogin = "didSignIn"
    static var userType = "userType"
    static let fireBaseToken =  "fireBaseToken"
    static var count = 0
    
    
    static func setId ( _ id : Int){
        UserDefaults.standard.set(id, forKey: self.id)
    }
    static func getId () ->Int{
        return UserDefaults.standard.integer(forKey: self.id) 
    }
    
    static func setName ( _ name : String){
        UserDefaults.standard.set(name, forKey: self.name)
    }
    static func getname () ->String{
        return UserDefaults.standard.string(forKey: self.name) ??  ""
    }
    
    static func setEmail ( _ email : String){
        UserDefaults.standard.set(email, forKey: self.email)
    }
    static func getEmail () ->String{
        return UserDefaults.standard.string(forKey: self.email) ??  ""
    }
    
    static func setAddress ( _ address : String){
        UserDefaults.standard.set(address, forKey: self.address)
    }
    static func getAddress () ->String{
        return UserDefaults.standard.string(forKey: self.address) ??  ""
    }
    
    static func setIdNumber ( _ idNumber : String){
        UserDefaults.standard.set(idNumber, forKey: self.idNumber)
    }
    static func getIdNumber () ->String{
        return UserDefaults.standard.string(forKey: self.idNumber) ??  ""
    }
    
    static func setPhone ( _ phone : String){
        UserDefaults.standard.set(phone, forKey: self.phone)
    }
    static func getPhone () ->String{
        return UserDefaults.standard.string(forKey: self.phone) ??  ""
    }
    
    static func setImage ( _ image : String){
        UserDefaults.standard.set(image, forKey: self.image)
    }
    static func getImage () ->String{
        return UserDefaults.standard.string(forKey: self.image) ??  ""
    }
    static func setCountryCode ( _ countryCode : String){
        UserDefaults.standard.set(countryCode, forKey: self.countryCode)
    }
    static func getCountryCode () ->String{
        return UserDefaults.standard.string(forKey: self.countryCode) ??  ""
    }
    static func setNumCount ( _ numCount : Int){
        UserDefaults.standard.set(numCount, forKey: self.numCount)
    }
    static func getNumCount () ->Int{
        return UserDefaults.standard.integer(forKey: self.numCount)
    }
    static func setCountryId ( _ countryId : Int){
        UserDefaults.standard.set(countryId, forKey: self.countryId)
    }
    static func getCountryId () ->Int{
        return UserDefaults.standard.integer(forKey: self.countryId)
    }
    static func setCountryFlag ( _ countryFlag : String){
        UserDefaults.standard.set(countryFlag, forKey: self.countryFlag)
    }
    static func getCountryFlag () ->String{
        return UserDefaults.standard.string(forKey: self.countryFlag) ??  ""
    }
   
  
    static func setToken ( _ token : String){
        UserDefaults.standard.set(token, forKey: self.token)
    }
    static func getToken () ->String{
        return UserDefaults.standard.string(forKey: self.token) ??  ""
    }
    
    
    static func setcheckLogin (_ logedIn: Bool){
        UserDefaults.standard.set(logedIn, forKey: checkLogin)
    }
    static func getcheckLogin() ->Bool{
        return UserDefaults.standard.bool(forKey: checkLogin)
    }
    
    static func setUserType ( _ userType : Int){
        UserDefaults.standard.set(userType, forKey: self.userType)
    }
    static func getUserType () ->Int{
        return UserDefaults.standard.integer(forKey: self.userType)
    }
    
    static func setFireBaseToken ( _ fireBaseToken : String){
        UserDefaults.standard.set(fireBaseToken, forKey: self.fireBaseToken)
    }
    static func getFireBaseToken () ->String{
        return UserDefaults.standard.string(forKey:  self.fireBaseToken) ?? ""
    }
    
}
