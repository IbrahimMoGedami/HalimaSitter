//
//  Register+Api.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import ImageSlideshow

extension RegisterViewController : NVActivityIndicatorViewable   {
  
    
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
                self.completeDataPhone()
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
    }
    
    
    func completeDataPhone()  {
        if countries?.data?.count ?? 0 > 0 {
            if let count = countries?.data?[0].phoneNum {
                numberCount = count
            }
            if let code = countries?.data?[0].id {
                countryId = code
            }
            if let codeCountry = countries?.data?[0].phoneKey {
                countryCodeLbl.text = codeCountry
            }
        }
    }
    
    //    MARK: - Func to Get Register
    
    func getRegisterData(){
        if validateRegister(){
        self.startAnimating()
            Services.getRegister(name: nameTf.text!, phone: phoneTf.text!, countryId: countryId!, email: emailTf.text!, fireBase: FirebaseMessagingManger.firebaseMessagingToken, nationality: nationalyTf.text!, password: passwordTf.text!, type: userType!, nurseryName: nurresyNameTf.text ?? "", lat: latitude!, lng: longitude!, address: address!, callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.register = result
                self.saveDataInUserDeafults()
                self.clearText()
                self.goToCompleteRegister()
            }else{
                Alert.show("Error".localized, massege: result.message ?? "", context: self)

            }

        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
        }
    }

}
