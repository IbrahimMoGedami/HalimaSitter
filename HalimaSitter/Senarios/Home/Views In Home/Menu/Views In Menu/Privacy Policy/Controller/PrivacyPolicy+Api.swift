//
//  PrivacyPolicy+Api.swift
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
extension PrivacyPolicyViewController : NVActivityIndicatorViewable   {
    
    
    
    //    MARK: - Func to Get My Settings
    
    func getMySettings(){
        self.startAnimating()
        Services.getSettings(  callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.settings = result
                self.completeData()
               
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
        
        
        
    }
    
    
    func completeData()  {
        if let policy = settings?.data?.policy {
            policyLbl.text = policy
        }
        
        if let phone = settings?.data?.phone {
            phoneLbl.text = phone
        }
    }
    
    
    func getCall(){
        
        if let phone = settings?.data?.phone {
            if let phoneCallURL = URL(string: "tel://\(phone)") {
                let application:UIApplication = UIApplication.shared
                if application.canOpenURL(phoneCallURL) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                }}
        }
    }
        

}
