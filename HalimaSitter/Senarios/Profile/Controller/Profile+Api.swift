//
//  Profile+Api.swift
//  Halima
//
//  Created by Moustafa on 7/10/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import ImageSlideshow

extension ProfileViewController : NVActivityIndicatorViewable   {
  
    
    //    MARK: - Func to Get Current Country
    
    func getCountriesData(){
        self.startAnimating()
        Services.getCountries(callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.countries = result
                self.flagTableView.reloadData()
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
    }
    
    

    
    //    MARK: - Func to Get Profile Data
    
    func getProfileData(){
        self.startAnimating()
            Services.getMyInfo( callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.register = result
                self.completeData()
            }else{
                Alert.show("Error".localized, massege: result.message ?? "", context: self)

            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        
        }
    }

    
    //    MARK: - Func to Get Edit Profile

    func getEditProfilrData(){
        if validateEditProfile(){
        self.startAnimating()
            Services.getEditProfile(name: nameTf.text!, phone: phoneTf.text!, countryId: countryId!, email: emailTf.text!, gender: gender ?? 0, nationality: nationalyTf.text!, moneyRate: servicePriceTf.text!, aboutSitter: aboutTv.text, nurseryName: nurseyNameTf.text ?? "", image: profileImage.image ?? UIImage(),callback:{ [weak self] (result)  in
                guard let self = self else {return}
                self.stopAnimating()
                print(result)
                if result.status == 1 {
                    self.register = result
                    Alert.show("Success".localized, massege: "editProfile1".localized, context: self)
                }
            }) { (error) in
                self.stopAnimating()
                print(error.localizedDescription)
            }
        }
    }

}
