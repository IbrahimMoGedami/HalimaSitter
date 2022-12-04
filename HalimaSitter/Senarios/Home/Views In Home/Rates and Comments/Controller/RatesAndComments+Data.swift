//
//  RatesAndComments+Data.swift
//  Halima
//
//  Created by Moustafa on 7/13/21.
//

import UIKit

extension RatesAndCommentsViewController {
    
    func completeData()  {
        
        
        if let name = parents?.username {
            nameLbl.text = name
        }
        
        
        if let rate = parents?.rate {
            rateView.rating = Double(rate)
        }
        
        if let rateCount = parents?.countRate {
            countRateLbl.text = "\(rateCount) \("Home3".localized)"
        }
        
    }
}
