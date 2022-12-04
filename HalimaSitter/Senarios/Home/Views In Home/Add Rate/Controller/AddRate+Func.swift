//
//  AddRate+Func.swift
//  Halima
//
//  Created by Moustafa on 7/24/21.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie

extension AddRateViewController :  UITextViewDelegate{
  
    public func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text == "" {
                textView.textColor = .lightGray
                textView.text = "AddRate1".localized
            }
        }
        
        public func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.text == "AddRate1".localized {
                textView.textColor = UIColor(named: "LblColor1")
                textView.text = ""
            }
        }
    
    
    func updateDesign()  {
        commentTextView.delegate = self
        commentTextView.text = "AddRate1".localized
    }

}
