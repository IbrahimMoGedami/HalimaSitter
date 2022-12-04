//
//  AddBabySiterViewController.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import UIKit

class AddBabySiterViewController: UIViewController {

    @IBOutlet weak var degreeTf: UITextField!
    @IBOutlet weak var nameTf: UITextField!
    var singleBabySiter : SingleBabySiter?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        getAddBabySiter()
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
