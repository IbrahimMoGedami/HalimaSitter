//
//  MyOrders+Api.swift
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
extension OrdersViewController : NVActivityIndicatorViewable   {
    
    
    
    //    MARK: - Func to Get My Orders
    
    func getMyOrders(){
        self.startAnimating()
        Services.getMyOrders(  callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.myOrders = result
                self.reloadData()
                self.checkOrder()
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
        
        
        
    }
    
    func checkOrder()  {
        if flag == 1 {
            if myOrders?.data?.ordersCurrent?.count == 0 {
                previousOrderView.isHidden = false
            }else{
                previousOrderView.isHidden = true
            }
        }else  if flag == 2  {
            if myOrders?.data?.reservations?.count == 0 {
                previousOrderView.isHidden = false
            }else{
                previousOrderView.isHidden = true
            }
        }else  if flag == 3  {
            if myOrders?.data?.ordersLast?.count == 0 {
                previousOrderView.isHidden = false
            }else{
                previousOrderView.isHidden = true
            }
        }
        
    }


}
