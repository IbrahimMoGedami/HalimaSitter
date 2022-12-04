//
//  OrdersViewController.swift
//  Halima
//
//  Created by Moustafa on 7/11/21.
//

import UIKit

class OrdersViewController: UIViewController {

    @IBOutlet weak var previousOrderView: UIView!
    @IBOutlet weak var previousOrdersTableView: UITableView!{
        didSet{
            previousOrdersTableView.rowHeight = 90
        }
    }
    
    var myOrders : MyOrders?
    var flag : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getMyOrders()

    }
    

    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
   
    
}
