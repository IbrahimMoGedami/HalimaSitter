//
//  AddBabySiters+Api.swift
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

extension AddBabySiterViewController : NVActivityIndicatorViewable   {
  
    
    //    MARK: - Func to Get BaySiters
    
    func getAddBabySiter(){
        if let name = nameTf.text , !name.isEmpty {
        self.startAnimating()
            Services.getAddBabySiter(name: name, degree: degreeTf.text ?? "",  callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.singleBabySiter = result
                self.clearData()
                self.navigationController?.popViewController(animated: true)       
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
        }else{
            Alert.show("Error".localized, massege: "AddBabySiter1".localized, context: self)

        }
    }
    
    
    func clearData()  {
        nameTf.text = ""
        degreeTf.text = ""
        
    }
    
   
    
}
