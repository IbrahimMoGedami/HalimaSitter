//
//  ForgetPasswordViewController.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var flagBtn: UIButton!
    @IBOutlet weak var flagTableView: UITableView!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var countryCodeLbl: UILabel!
    
    var countries : Countries?
    var countryId : Int?
    var numberCount : Int?
    var register : Register?

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tabToClosePopup))
        bigView.addGestureRecognizer(tapGesture)
        updateDesign()
        getCountriesData()  
    }
    
    @objc func tabToClosePopup()  {
        dismiss(animated: true, completion: nil)
    }
    

   
    
    @IBAction func flagBtnPressed(_ sender: UIButton) {
        if flagTableView.isHidden {
            animate(toogle: true, type: flagBtn)
        } else {
            animate(toogle: false, type: flagBtn)
        }
    }

    @IBAction func sendBtnPressed(_ sender: UIButton) {
        getForgetPasswordData()
    }
    
}
