//
//  RateAndComments+Api.swift
//  HalimaSitter
//
//  Created by Moustafa on 10/08/2021.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import ImageSlideshow
import GooglePlaces
import GoogleMaps
extension RatesAndCommentsViewController : NVActivityIndicatorViewable   {
    
    
    
    //    MARK: - Func to Get My User Rate
    
    func getMyUserRate(){
        if let userId = parents?.id {
        self.startAnimating()
        Services.getMyUserRate(  id: userId, callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.userRate = result
                self.ratesAndCommentsTablleView.reloadData()
                self.completeData()
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
        }
        
    }
        
    }
    
