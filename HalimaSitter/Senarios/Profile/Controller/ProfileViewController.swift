//
//  ProfileViewController.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit
import BEMCheckBox
class ProfileViewController: UIViewController {
    @IBOutlet weak var babySiterBtnView: UIView!
    @IBOutlet weak var servicePriceTf: UITextField!
    @IBOutlet weak var aboutTv: UITextView!
    @IBOutlet weak var nerseyView: UIView!
    @IBOutlet weak var nurseyNameTf: UITextField!
    @IBOutlet weak var nationalyTf: UITextField!
    @IBOutlet weak var imageFlag: UIImageView!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var flagTableView: UITableView!
    @IBOutlet weak var flagBtn: UIButton!
    @IBOutlet weak var checkFemale: BEMCheckBox!
    @IBOutlet weak var checkMale: BEMCheckBox!

    var countries : Countries?
    var countryId : Int?
    var numberCount : Int?
    var gender : Int?
    var register : Register?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDesign()
        getCountriesData()
        getProfileData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }

    
    
    @IBAction func flagBtnPressed(_ sender: UIButton) {
        if flagTableView.isHidden {
            animate(toogle: true, type: flagBtn)
        } else {
            animate(toogle: false, type: flagBtn)
        }
    }
    @IBAction func checkMaleOrFemaleBtn(_ sender: BEMCheckBox) {
        switch sender.tag {
        case 1:
            checkMale.on = true
            checkFemale.on = false
            gender = 1
        case 2:
            checkMale.on = false
            checkFemale.on = true
            gender = 2
        default:
            print("xx")
        }
    }
    
    @IBAction func profileImageBtnPressed(_ sender: UIButton) {
        show()
    }
    @IBAction func viewBabySiterBtnPressed(_ sender: UIButton) {
        goToBabySiterListView()
    }
    @IBAction func viewRoomsBtnPressed(_ sender: UIButton) {
        goTRoomsListView()
    }
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        getEditProfilrData()
    }
}
