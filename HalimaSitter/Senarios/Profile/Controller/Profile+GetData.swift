//
//  Profile+GetData.swift
//  Halima
//
//  Created by Moustafa on 7/15/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension ProfileViewController  {
    
    func completeData()  {
        if let image = register?.data?.image {
        profileImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "NoImage"))
        }
        if let name = register?.data?.username {
        nameTf.text = name
        }
        if let phone = register?.data?.phone {
            phoneTf.text = phone
        }
        if let flageImage = register?.data?.country?.icon {
            imageFlag.sd_setImage(with: URL(string: flageImage), placeholderImage: UIImage(named: "NoImage"))
        }
        if let id = register?.data?.country?.id {
            self.countryId = id
        }
        if let phoneNum = register?.data?.country?.phoneNum {
            self.numberCount = phoneNum
        }
        if let email = register?.data?.email {
            emailTf.text = email
        }
        
        if let nationality = register?.data?.nationality {
            nationalyTf.text = nationality
        }
        
        if let type = register?.data?.type {
            if type == 1 {
                nerseyView.isHidden = true
                babySiterBtnView.isHidden = true
            }else{
                nerseyView.isHidden = false
                babySiterBtnView.isHidden = false

                if let nurseryName = register?.data?.nurseryName {
                    nurseyNameTf.text = nurseryName
                }
            }
        }
        
        if let gender = register?.data?.gender {
            switch gender {
            case 1:
                checkMale.on = true
                checkFemale.on = false
                self.gender = 1
            case 2:
                checkMale.on = false
                checkFemale.on = true
                self.gender = 2
            default:
                print("xx")
            }
        }
        
        if let about = register?.data?.aboutSitter {
            aboutTv.text = about
        }
        
        if let moneyRate = register?.data?.moneyRate {
            servicePriceTf.text = moneyRate
        }
       
        
    }
    
    
    
    
}
