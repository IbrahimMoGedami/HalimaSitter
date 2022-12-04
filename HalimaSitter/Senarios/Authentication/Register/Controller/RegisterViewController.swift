//
//  RegisterViewController.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var addressTf: DesignableUITextField!
    @IBOutlet weak var nurresyNameTf: DesignableUITextField!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTf: DesignableUITextField!
    @IBOutlet weak var nationalyTf: DesignableUITextField!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var emailTf: DesignableUITextField!
    @IBOutlet weak var nameTf: DesignableUITextField!
    @IBOutlet weak var flagBtn: UIButton!
    @IBOutlet weak var flagTableView: UITableView!
    @IBOutlet weak var countryCodeLbl: UILabel!
    @IBOutlet weak var taxCertificateLbl: UILabel!
    
    var countries : Countries?
    var countryId : Int?
    var numberCount : Int?
    var userType : Int?
    var register : Register?
    var latitude : Double?
    var longitude : Double?
    var address : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDesign()
        getCountriesData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func flagBtnPressed(_ sender: UIButton) {
        if flagTableView.isHidden {
            animate(toogle: true, type: flagBtn)
        } else {
            animate(toogle: false, type: flagBtn)
        }
    }
    
    @IBAction func addressBtnPressed(_ sender: UIButton) {
        goToConfrimAddressView()
    }
    
    @IBAction func backToLogin(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func uploadTaxCertificateLogin(_ sender: UIButton) {
    }
    
    @IBAction func NextBynPressed(_ sender: UIButton) {
        getRegisterData()
    }
    
}
