//
//  Rooms+Func.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension RoomsViewController : RoomAction {
    
    
    func goToAddRoom()  {
        let vc = AppStoryboard.AddRoom.viewController(viewControllerClass: AddRoomViewController.self)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
   
    func delete(index: Int) {
        if let id = rooms?.data?[index].id {
            getDeleteRoom(roomId: id, index: index)
        }
    }
    
    
   
    
    func checkNoRoom()  {
        if rooms?.data?.count == 0 {
            noRoomView.isHidden = false
        }else{
            noRoomView.isHidden = true
        }
        
      
    }
    
}
