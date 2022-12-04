//
//  AddRateViewController.swift
//  Halima
//
//  Created by Moustafa on 7/24/21.
//

import UIKit
import Cosmos
class AddRateViewController: UIViewController {
    
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var rateView: CosmosView!
    var singleOrder: SingleOrder?
   

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tabToClosePopup))
        bigView.addGestureRecognizer(tapGesture)
        updateDesign()
        // Do any additional setup after loading the view.
    }
    

    
    @objc func tabToClosePopup()  {
        dismiss(animated: true, completion: nil)
    }
    

  
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        getAddRateAndComment()
    }
    
}
