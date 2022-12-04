//
//  CompleteRegister+Valdation.swift
//  HalimaSitter
//
//  Created by Moustafa on 03/08/2021.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension CompleteRegisterViewController  {
    
    //MARK: - Func to Validation of Login Text Field With Phone Is Empty Or Not
    
    func validateCompleteRegister()->Bool {
        
        if let leaseImage = leaseImage {
            if let residencyImage = residencyImage {
                if let profileImage = profileImage {
                    if let userType = userType {
                        if userType == 1 {
                            return true
                        }else{
                            if valdateNurresy(){
                                return true
                            }else{
                                return false
                            }
                        }
                    }else{
                        return false
                    }
                }else{
                    Alert.show("Error".localized, massege: "Register14".localized, context: self)
                    self.stopAnimating()
                    return false
                }
            }else{
                Alert.show("Error".localized, massege: "Register13".localized, context: self)
                self.stopAnimating()
                return false
            }
        }else{
            Alert.show("Error".localized, massege: "Register12".localized, context: self)
            self.stopAnimating()
            return false
        }
    }
    
    
    func valdateNurresy() -> Bool {
       // if let taxNumberImage = taxNumberImage {
            if let commercialRegisterImage = commercialRegisterImage {
                return true
            }else{
                Alert.show("Error".localized, massege: "Register16".localized, context: self)
                self.stopAnimating()
                return false
            }
       // }else{
//            Alert.show("Error".localized, massege: "Register15".localized, context: self)
//            self.stopAnimating()
//            return false
//        }
    }
    
    func getImageAndFiles(){
        certificatesImages = []
        certificatesPdf = []
        for i in attach {
            if i.type == 1 {
                if let image = i.image {
                certificatesImages.append(image)
                }
            }else if i.type == 2 {
                if let pdf = i.data {
                certificatesPdf.append(pdf)
                }
            }
        }
        print(certificatesImages)
        print(certificatesPdf)
    }
    
}
