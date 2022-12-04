//
//  BabySiter+Api.swift
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

extension BabySitersViewController : NVActivityIndicatorViewable   {
  
    
    //    MARK: - Func to Get BaySiters
    
    func getBabySiters(){
        self.startAnimating()
        Services.getBabySiters( callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.babySiters = result
                self.babySitersTableView.reloadData()
                self.checkNoRoom()
               
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
    }
    
    //    MARK: - Func to Get Delete BabySiters
    
    func getDeleteBabySiter(babySiter : Int , index : Int){
        self.startAnimating()
        Services.getDeleteBabySiter(id: babySiter, callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.babySiters?.data?.remove(at: index)
                self.babySitersTableView.reloadData()
                self.checkNoRoom()

            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
    }
    
    
   
    
}
