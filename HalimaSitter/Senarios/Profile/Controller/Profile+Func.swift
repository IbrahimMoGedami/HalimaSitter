//
//  Profile+Func.swift
//  Halima
//
//  Created by Moustafa on 7/10/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension ProfileViewController  {
  
    
    func updateDesign()  {
        self.navigationController?.isNavigationBarHidden = true
        setUpTableView()
        flagTableView.isHidden = true
        

    }
    
    func animate(toogle: Bool, type: UIButton) {
        
        if type == flagBtn {
            
            if toogle {
                UIView.animate(withDuration: 0.3) {
                    self.flagTableView.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.flagTableView.isHidden = true
                }
            }
            
        }
        
    }
    
    
   
    
    func goTRoomsListView()  {
        let vc = AppStoryboard.Rooms.viewController(viewControllerClass: RoomsViewController.self)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToBabySiterListView()  {
        let vc = AppStoryboard.BabySiters.viewController(viewControllerClass: BabySitersViewController.self)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
