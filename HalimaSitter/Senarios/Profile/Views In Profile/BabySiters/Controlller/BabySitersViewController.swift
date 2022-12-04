//
//  BabySitersViewController.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import UIKit

class BabySitersViewController: UIViewController {

    @IBOutlet weak var noBabySiterView: UIView!
    @IBOutlet weak var babySitersTableView: UITableView!{
        didSet{
            babySitersTableView.rowHeight = 70
        }
    }
    var babySiters : BabySiters?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getBabySiters()

    }
    
    @IBAction func addNewBabySiterBtnPressed(_ sender: UIButton) {
        goToAddBabySiter()
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
