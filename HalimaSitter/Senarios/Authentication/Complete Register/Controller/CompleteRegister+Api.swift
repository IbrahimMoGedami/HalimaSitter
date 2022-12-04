//
//  CompleteRegister+Api.swift
//  HalimaSitter
//
//  Created by Moustafa on 02/08/2021.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import ImageSlideshow

extension CompleteRegisterViewController : NVActivityIndicatorViewable   {
    
    //    MARK: - Func to Get Complete Register
    
    func getCompleteRegisterData(){
        if validateCompleteRegister() {
            getImageAndFiles()
        self.startAnimating()
        Services.getCompleteRegister(residency: residencyImage!, lease: leaseImage!, profilImage: profileImage!, taxCard: taxNumberImage ?? UIImage(), commercialRegister: commercialRegisterImage ?? UIImage(), certificatesImages: certificatesImages, certificatesFiles: certificatesPdf ,callback:{ [weak self] (result)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            if result.status == 1 {
            self.register = result
            self.clearText()
            self.goToWating()
            }
        }) { (error) in
            self.stopAnimating()
            print(error.localizedDescription)
        }
        }
    }
    
    
}
