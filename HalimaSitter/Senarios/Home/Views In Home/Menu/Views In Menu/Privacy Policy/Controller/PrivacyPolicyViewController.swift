//
//  PrivacyPolicyViewController.swift
//  Halima
//
//  Created by Moustafa on 7/12/21.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {

    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var policyLbl: UILabel!
    var settings : Settings?
    override func viewDidLoad() {
        super.viewDidLoad()
        getMySettings()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func phoneBtnPressed(_ sender: UIButton) {
        getCall()
    }
    
}
