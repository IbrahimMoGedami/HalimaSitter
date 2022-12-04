//
//  Register+GetLocation.swift
//  HalimaSitter
//
//  Created by Moustafa on 03/08/2021.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import ImageSlideshow

extension RegisterViewController : LocationData   {
    func goToLocationView(lat: Double, long: Double, address: String) {
        latitude = lat
        longitude = long
        self.address = address
        addressTf.text = address
    }
    

    
}
