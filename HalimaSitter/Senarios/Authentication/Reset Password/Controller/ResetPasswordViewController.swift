//
//  ResetPasswordViewController.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var confrimPasswordTf: DesignableUITextField!
    @IBOutlet weak var passwordTf: DesignableUITextField!
    
    var register : Register?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDesign()
        // Do any additional setup after loading the view.
    }
    

    

    @IBAction func resetPasswordBtnPressed(_ sender: UIButton) {
        getResetPasswordData()
    }
}
