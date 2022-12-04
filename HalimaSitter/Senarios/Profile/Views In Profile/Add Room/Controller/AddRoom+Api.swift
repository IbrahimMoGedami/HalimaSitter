//
//  AddRoom+Api.swift
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

extension AddRoomViewController : NVActivityIndicatorViewable   {
  
    
   
    
    
    //    MARK: - Func to Get Edit Profile

    func getAddRoom(){
        if validateAddRoom(){
        self.startAnimating()
            Services.getAddRoom(name: roomNameTf.text!, image: arrayRoomImage,callback:{ [weak self] (result)  in
                guard let self = self else {return}
                self.stopAnimating()
                print(result)
                if result.status == 1 {
                    self.singleRoom = result
                    self.clearData()
                    self.navigationController?.popViewController(animated: true)                }
            }) { (error) in
                self.stopAnimating()
                print(error.localizedDescription)
            }
        }
    }
    
    
    func clearData()  {
        roomNameTf.text = ""
        arrayRoomImage.removeAll()
        roomImageCoolectionView.reloadData()
        
    }
    

}
