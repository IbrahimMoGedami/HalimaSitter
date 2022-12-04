//
//  NotificationViewController.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var noNotiView: UIView!
    @IBOutlet weak var notificationTableView: UITableView!{
        didSet{
            notificationTableView.rowHeight = 83
        }
    }
   var myNotification : MyNotification?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        self.navigationController?.isNavigationBarHidden = true
        getNotificationData()
        // Do any additional setup after loading the view.
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
    }
    
}

