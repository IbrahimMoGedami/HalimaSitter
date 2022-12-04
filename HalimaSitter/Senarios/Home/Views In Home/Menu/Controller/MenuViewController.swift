//
//  MenuViewController.swift
//  Halima
//
//  Created by Moustafa on 7/8/21.
//

import UIKit

class MenuViewController: UIViewController {

    var register : Register?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func menuBtnPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("hisdak")
        case 2:
            changeLanguage()
        case 4:
            goToPrivacyPolicy()
        case 5:
            goToOAbout()
        case 6:
            getLogOut()
        case 7:
            goToChagePassword()
        default:
            print("xx")
        }
    
    }
    
    @IBAction func backVtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
