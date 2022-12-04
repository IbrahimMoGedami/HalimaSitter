//
//  Messages+Api.swift
//  Halima
//
//  Created by Moustafa on 7/17/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import ImageSlideshow

extension MessagesViewController : NVActivityIndicatorViewable   {
  
    
    //    MARK: - Func to Get Chat Data
    
    func getChatData(id : Int ){
        self.startAnimating()
        Services.getMyChat( id: id, callback: { [weak self] (result,stats)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            print("stats code is \(stats)")
            if  result.status == 1 {
                self.parentMessages = result
                self.messageTableView.reloadData()
                self.checkMessage()
            }
            
        }) { (error,stats) in
            print("stats code is \(stats)")
            self.stopAnimating()
            print(error.localizedDescription)
        }
    }
    
    
    func checkMessage()  {
        if parentMessages?.data?.count == 0 {
            noMessageLbl.isHidden = false
        }else{
            noMessageLbl.isHidden = true
        }
    }
    
}
