//
//  CurrentOrderDetailesViewController.swift
//  HalimaSitter
//
//  Created by Moustafa on 09/08/2021.
//

import UIKit
import Cosmos
import GoogleMaps
import GooglePlaces

class CurrentOrderDetailesViewController: UIViewController {
    @IBOutlet weak var heightScrollView: NSLayoutConstraint!
    @IBOutlet weak var endView: UIView!
    @IBOutlet weak var startView: UIView!
    @IBOutlet weak var accpetedOrResfulView: UIView!
    @IBOutlet weak var orderChildHeight: NSLayoutConstraint!
    @IBOutlet weak var orderAddressMap: GMSMapView!
    @IBOutlet weak var orderDetailesTableDelagte: UITableView!{
        didSet{
            orderDetailesTableDelagte.rowHeight = 100
        }
    }
    @IBOutlet weak var parentNationalityLbl: UILabel!
    @IBOutlet weak var parentRateCount: UILabel!
    @IBOutlet weak var parentRateView: CosmosView!
    @IBOutlet weak var parentAddressLbl: UILabel!
    @IBOutlet weak var parentNameLbl: UILabel!
    @IBOutlet weak var parentImage: UIImageView!
    var singleOrder: SingleOrder?
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
   
    @IBAction func reviewsBtnPressed(_ sender: UIButton) {
       goToRatesAndCommentsView()
    }
  
    @IBAction func callBtnPressed(_ sender: UIButton) {
        getCall()
    }
    
    @IBAction func bgImageBtnPressed(_ sender: UIButton) {
       goToSingleImageView()
    }
   
    @IBAction func changeStatsOrderPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            getMyChangeStats(stats: 2)
        case 2:
            getMyChangeStats(stats: 3)
        case 3:
            getMyChangeStats(stats: 5)
        case 4:
            getMyChangeStats(stats: 7)
        default:
            print("xx")
        }
    }
    
}
