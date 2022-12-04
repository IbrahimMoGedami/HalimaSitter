//
//  AddRoom+Func.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension AddRoomViewController  {
    
    
    //MARK: - Func to Validation of Login Text Field With Phone Is Empty Or Not
    
    func validateAddRoom()->Bool {
        if  let name = roomNameTf.text  ,
            !name.isEmpty  {
            if arrayRoomImage.count > 0 {
                return true
            }else{
                Alert.show("Error".localized, massege: "AddRoom2".localized, context: self)
                self.stopAnimating()
                return false
            }
            
        }else {
            roomNameTf.becomeFirstResponder()
            Alert.show("Error".localized, massege: "AddRoom1".localized, context: self)
            CustomDesign.validateNotDone(textField: roomNameTf, revert: true)
            self.stopAnimating()
            return false
        }
    }
    
    
  
    
}
