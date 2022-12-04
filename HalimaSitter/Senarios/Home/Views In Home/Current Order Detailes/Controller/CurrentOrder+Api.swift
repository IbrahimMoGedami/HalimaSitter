//
//  CurrentOrder+Api.swift
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
extension CurrentOrderDetailesViewController : NVActivityIndicatorViewable   {
    
    
    
    //    MARK: - Func to Get My Change Stats
    
    func getMyChangeStats(stats : Int){
        if let id = singleOrder?.id {
        self.startAnimating()
        Services.getMyChangeStats(orderId: id, status: stats,   callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.singleOrder = result.data
                self.reloadData()
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
        }
        
        
        
    }

}
    
