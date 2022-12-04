//
//  RatesAndCommentsViewController.swift
//  Halima
//
//  Created by Moustafa on 7/11/21.
//

import UIKit
import Cosmos
class RatesAndCommentsViewController: UIViewController {

    @IBOutlet weak var countRateLbl: UILabel!
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ratesAndCommentsTablleView: UITableView!
    var userRate : UserRate?
    var parents : Parent?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        getMyUserRate()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
