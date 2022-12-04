//
//  AppStoryboard.swift
//  EdeWin
//
//  Created by Mustafa on 8/1/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit

enum AppStoryboard : String {
    
    case Main
    case Login
    case UserType
    case Register
    case CompleteRegister
    case ConfrimAddress
    case WaitToAccpeted
    case ForgetPassword
    case ValidationCode
    case ResetPassword
    case Tab
    case Home
    case Notification
    case Messages
    case Profile
    case Rooms
    case AddRoom
    case BabySiters
    case AddBabySiters
    case Orders
    case CurrentOrderDetailes
    case RatesAndComments
    case Menu
    case About
    case PrivacyPolicy
    case OrderDetailes
    case SingleChat
    case AddRate
    case SingleImage
    case Calling
    case Video
    case Voice
    case ChangePassword
    

    var instance : UIStoryboard {
        
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID : String {
        
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        
        return appStoryboard.viewController(viewControllerClass: self)
    }
}

