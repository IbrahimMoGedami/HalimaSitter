//
//  ValidationCodeViewController.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit

class ValidationCodeViewController: UIViewController {
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var codeTf4: UITextField!
    @IBOutlet weak var codeTf3: UITextField!
    @IBOutlet weak var codeTf2: UITextField!
    @IBOutlet weak var codeTf1: UITextField!
    @IBOutlet weak var resendCodeBtn: UIButton!
    @IBOutlet weak var timeLbl: UILabel!
    
    var phone : String?
    var countryId : Int?
    var register : Register?
    var time : Int = 30

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDesign()
        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func resendCodeBtnPressed(_ sender: UIButton) {
        getForgetPasswordData()
    }
    @IBAction func sendCodeBtnPressed(_ sender: UIButton) {
        getValdationCode()
        

    }
}
