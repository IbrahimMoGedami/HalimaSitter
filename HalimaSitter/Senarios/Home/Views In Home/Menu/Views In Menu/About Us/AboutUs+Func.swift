//
//  AboutUs+Func.swift
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
extension AboutUsViewController    {
    
    func openFaceBook()  {
        if let faceBookUrl = settings?.data?.facebook {
            guard let url = URL(string: faceBookUrl) else { return }
            UIApplication.shared.open(url)
        }
    }
    
    func openTwitter()  {
        if let twitterUrl = settings?.data?.twitter {
            guard let url = URL(string: twitterUrl) else { return }
            UIApplication.shared.open(url)
        }
    }
    
    func openInstagram()  {
        if let instagramUrl = settings?.data?.instagram {
            guard let url = URL(string: instagramUrl) else { return }
            UIApplication.shared.open(url)
        }
    }
    
}
