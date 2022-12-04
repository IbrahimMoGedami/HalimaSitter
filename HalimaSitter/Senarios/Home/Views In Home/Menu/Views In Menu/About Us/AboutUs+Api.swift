//
//  AboutUs+Api.swift
//  Halima
//
//  Created by Moustafa on 7/17/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import ImageSlideshow
import GooglePlaces
import GoogleMaps
extension AboutUsViewController : NVActivityIndicatorViewable   {
    
    
    
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
        if let about = settings?.data?.about {
            aboutLbl.text = about
        }
    }

}
