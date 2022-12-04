//
//  AboutUsViewController.swift
//  Halima
//
//  Created by Moustafa on 7/11/21.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var aboutLbl: UILabel!
    @IBOutlet weak var bottomView: CardCusstomView!
    @IBOutlet weak var aboutViewText: CardCusstomView!
    var settings : Settings?

    override func viewDidLoad() {
        super.viewDidLoad()
        aboutViewText.layer.cornerRadius = 20
        bottomView.layer.cornerRadius = 20
        getMySettings()
    }
    
    @IBAction func faceBookBtnPressed(_ sender: UIButton) {
        openFaceBook()
    }
    @IBAction func twttierBtnPressed(_ sender: UIButton) {
        openTwitter() 
    }
    @IBAction func instagramBtnPressed(_ sender: UIButton) {
        openInstagram()
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
