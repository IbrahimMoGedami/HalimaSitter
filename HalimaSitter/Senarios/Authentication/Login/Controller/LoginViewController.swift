//
//  LoginViewController.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTf: DesignableUITextField!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var flagBtn: UIButton!
    @IBOutlet weak var flagTableView: UITableView!
    @IBOutlet weak var countryCodeLbl: UILabel!
    

    var countries : Countries?
    var countryId : Int?
    var numberCount : Int?
    var register : Register?


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        updateDesign()
        
#if DEBUG
        phoneTf.text = "555555556"
        passwordTf.text = "123456"
        countryCodeLbl.text = "966"
        countryId
#endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCountriesData()
    }
    

    @IBAction func flagBtnPressed(_ sender: UIButton) {
        if flagTableView.isHidden {
            animate(toogle: true, type: flagBtn)
        } else {
            animate(toogle: false, type: flagBtn)
        }
    }
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        getLoginData()
    }
    @IBAction func forgetPassword(_ sender: UIButton) {
        goToForgetPassword()
    }
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        goToUserType()
    }
}
