//
//  Urls.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import Foundation

class URLs {
    
    // MARK: - The BasicPath
    
    static let baseURL = "https://api.haleemh.sa/apiSitter/"
//    static let baseURL = "https://halimah.almusand.com/apiSitter/"


    //  MARK: - Authentication
    
    static let register = baseURL + "Auth_general/register"
    static let completeRegister = baseURL + "Auth_private/complete"
    static let countries = baseURL + "Location/countries"
    static let login = baseURL + "Auth_general/login"
    static let forgetPassword = baseURL + "Auth_general/forget_password"
    static let validationCode = baseURL + "Auth_private/check_password_code"
    static let resetPassword = baseURL + "Auth_private/reset_password"
    static let changePassword = baseURL + "Auth_private/change_password"
  

    //  MARK: - Home
    
    static let home = baseURL + "general/home"
    static let myOrders = baseURL + "Order/myOrders"
    static let changeStats = baseURL + "Order/orderChangeStatus"
    static let userRate = baseURL + "Rate/getUserRate"
    static let addRate = baseURL + "Rate/rate_user"

    
    //  MARK: - Profile
    
    static let profileData = baseURL + "Auth_private/my_info"
    static let editProfile = baseURL + "Auth_private/edit_profile"
    static let Rooms = baseURL + "Room/all"
    static let deleteRoom = baseURL + "Room/delete"
    static let addRoom = baseURL + "Room/create"
    static let BabySiters = baseURL + "NurseryMember/all"
    static let deletebabySiter = baseURL + "NurseryMember/delete"
    static let addBabySiter = baseURL + "NurseryMember/create"
    
    //  MARK: - Menu

    static let logOut = baseURL + "Auth_private/logout"
    static let changeLang = baseURL + "Auth_private/change_lang"
    static let setting = baseURL + "general/getSettings"
    static let chat = baseURL + "chatData"
    static let notification = baseURL + "Auth_private/myNotification"

    
}
