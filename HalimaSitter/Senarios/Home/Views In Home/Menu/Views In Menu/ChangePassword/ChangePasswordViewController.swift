//
//  ChangePasswordViewController.swift
//  HalimaSitter
//
//  Created by Sameh Sengab on 06/11/2022.
//

import Foundation
import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var oldPasswordTextField: DesignableUITextField!
    @IBOutlet weak var newPasswordTextField: DesignableUITextField!
    
    var register : Register?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDesign()
        // Do any additional setup after loading the view.
    }
    

    

    @IBAction func resetPasswordBtnPressed(_ sender: UIButton) {
        changePasswordData()
    }
}
