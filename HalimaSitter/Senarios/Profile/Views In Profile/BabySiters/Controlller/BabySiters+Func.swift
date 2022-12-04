//
//  BabySiters+Func.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension BabySitersViewController : RoomAction {
    
    
    func goToAddBabySiter()  {
        let vc = AppStoryboard.AddBabySiters.viewController(viewControllerClass: AddBabySiterViewController.self)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
   
    func delete(index: Int) {
        if let id = babySiters?.data?[index].id {
            getDeleteBabySiter(babySiter: id, index: index)
        }
    }
    
    
   
    
    func checkNoRoom()  {
        if babySiters?.data?.count == 0 {
            noBabySiterView.isHidden = false
        }else{
            noBabySiterView.isHidden = true
        }
        
      
    }
    
}
