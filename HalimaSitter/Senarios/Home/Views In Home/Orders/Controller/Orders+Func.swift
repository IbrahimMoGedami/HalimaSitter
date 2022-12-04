//
//  Orders+Func.swift
//  Halima
//
//  Created by Moustafa on 7/12/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension OrdersViewController : RateViewPopup {
   
    
    
    func goToCurrentOrderDetailes(singleOrder : SingleOrder)  {
        let vc = AppStoryboard.CurrentOrderDetailes.viewController(viewControllerClass: CurrentOrderDetailesViewController.self)
        vc.modalPresentationStyle = .fullScreen
        vc.singleOrder = singleOrder
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func reloadData()  {
        previousOrdersTableView.reloadData()
    }
    
    func goToRate(singleOrder: SingleOrder) {
        let vc = AppStoryboard.AddRate.viewController(viewControllerClass: AddRateViewController.self)
        vc.modalPresentationStyle = .overFullScreen
        vc.singleOrder = singleOrder
        present(vc, animated: true, completion: nil)
    }
    
  
   
}
