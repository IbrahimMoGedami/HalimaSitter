//
//  AddRate+Api.swift
//  Halima
//
//  Created by Moustafa on 7/24/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import ImageSlideshow
import GooglePlaces
import GoogleMaps
extension AddRateViewController : NVActivityIndicatorViewable   {
    
    
    
    //    MARK: - Func to Get Add Rate And Comment
    
    func getAddRateAndComment(){
        if let parentId = singleOrder?.parent?.id {
        self.startAnimating()
            Services.getAddRateAndComment(userId: parentId, rate: Int(rateView.rating), comment: commentTextView.text ?? "",  callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.dismiss(animated: true, completion: nil)
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
        }
        
        
        
    }


}
