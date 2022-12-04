//
//  Rooms+Api.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import ImageSlideshow

extension RoomsViewController : NVActivityIndicatorViewable   {
  
    
    //    MARK: - Func to Get Rooms
    
    func getRoom(){
        self.startAnimating()
        Services.getRooms( callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.rooms = result
                self.roomsTableView.reloadData()
                self.checkNoRoom()
               
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
    }
    
    //    MARK: - Func to Get Delete Room
    
    func getDeleteRoom(roomId : Int , index : Int){
        self.startAnimating()
        Services.getDeleteRoom(id: roomId, callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.rooms?.data?.remove(at: index)
                self.roomsTableView.reloadData()
                self.checkNoRoom()

            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
    }
    
    
   
    
}
