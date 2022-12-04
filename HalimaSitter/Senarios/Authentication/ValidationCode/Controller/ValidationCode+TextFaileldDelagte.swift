//
//  ValidationCode+TextFaileldDelagte.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit
import MOLH
extension ValidationCodeViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 1
    }
    
    //TODO: Declare textFieldDidChange here:
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let code = textField.text
        if code?.utf16.count == 1 {
            switch textField {
            case codeTf1:
                codeTf2.becomeFirstResponder()
            case codeTf2:
                codeTf3.becomeFirstResponder()
            case codeTf3:
                codeTf4.becomeFirstResponder()
            case codeTf4:
                codeTf4.becomeFirstResponder()
            default:
                break
            }
        }
    }
    
    
}
