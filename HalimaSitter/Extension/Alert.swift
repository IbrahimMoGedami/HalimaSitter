//
//  Alert.swift
//  Eschoola
//
//  Created by Admin on 6/4/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import Foundation
import UIKit

class Alert {

    static func show(_ title:String, massege:String , context:UIViewController) {
       
      let alert = UIAlertController(title: title, message: massege, preferredStyle: .alert)
      // alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK".localized, style: .cancel, handler: nil))
      context.present(alert, animated: true)
   }

}
