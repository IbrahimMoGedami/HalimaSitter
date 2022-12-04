//
//  MyNotification+Api.swift
//  Halima
//
//  Created by Moustafa on 7/18/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import ImageSlideshow

extension NotificationViewController : NVActivityIndicatorViewable   {
  
    
    //    MARK: - Func to Get My Notification
    
    func getNotificationData(){
        self.startAnimating()
        Services.getMyNotification(callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.myNotification = result
                self.notificationTableView.reloadData()
                self.checkNoti()
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
    }
    
    func checkNoti()  {
        if myNotification?.data?.count == 0 {
            noNotiView.isHidden = false
        }else{
            noNotiView.isHidden = true
        }
    }
    
    func goToOrderDetailes(singleOrder : SingleOrder)  {
        let vc = AppStoryboard.OrderDetailes.viewController(viewControllerClass: OrdersDetailesViewController.self)
        vc.modalPresentationStyle = .fullScreen
        vc.singleOrder = singleOrder
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
    
