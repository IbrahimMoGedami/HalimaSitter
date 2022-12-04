//
//  OrdersDetailesViewController.swift
//  Halima
//
//  Created by Moustafa on 7/12/21.
//

import UIKit

class OrdersDetailesViewController: UIViewController {

    @IBOutlet weak var selectAdminBtn: UIButton!
    @IBOutlet weak var ordesStatsLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!

    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var trackingBtn: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var orderDetailesTableDelagte: UITableView!
    @IBOutlet weak var mountorNameLbl: UILabel!
    var singleOrder: SingleOrder?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(singleOrder)
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
  
    
    
}
