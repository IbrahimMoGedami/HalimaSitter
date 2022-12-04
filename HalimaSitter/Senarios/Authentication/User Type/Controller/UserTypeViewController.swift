//
//  UserTypeViewController.swift
//  HalimaSitter
//
//  Created by Moustafa on 02/08/2021.
//

import UIKit

class UserTypeViewController: UIViewController {

    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDesign()
        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func registerTypeBtnPressed(_ sender: UIButton) {
        goToRegister(userType: sender.tag)
    }
    @IBAction func backToLoginBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
