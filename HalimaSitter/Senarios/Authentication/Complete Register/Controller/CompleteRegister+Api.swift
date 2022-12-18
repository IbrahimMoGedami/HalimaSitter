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

extension CompleteRegisterViewController: NVActivityIndicatorViewable   {
    
    //    MARK: - Func to Get Complete Register
    
    func getCompleteRegisterData(){
        guard taxNumberTf.text?.count == 15 else {
            Alert.show("Error".localized, massege: "You must fill tax field with 15 number ".localized, context: self)
            return
        }
        if validateCompleteRegister() {
            getImageAndFiles()
            self.startAnimating()
            Services.getCompleteRegister(residency: residencyImage!, lease: leaseImage!, profilImage: profileImage!, taxCard: taxNumberTf.text ?? "", commercialRegister: commercialRegisterImage ?? UIImage(), certificatesImages: certificatesImages, certificatesFiles: certificatesPdf, licenseType: licenceId ?? "", callback: { [weak self] (result)  in
                guard let self = self else {return}
                self.stopAnimating()
                print(result)
                if result.status == 1 {
                    self.register = result
                    self.clearText()
                    self.goToWating()
                }
            }, failureHandler: { error in
                self.stopAnimating()
                print(error.localizedDescription)
            })
        }
    }
    
    
    func getLicencesData(){
        self.startAnimating()
        Services.getLicences(callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.licencesData = result.data ?? []
                self.licencesPicker.array = result.data?.map({$0.name}) as! [String]
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
    }
    
    
}
