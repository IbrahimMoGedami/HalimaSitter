//
//  MessagesViewController.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit

class MessagesViewController: UIViewController {
    @IBOutlet weak var noMessageLbl: UILabel!
    @IBOutlet weak var headerView: UIView!{
        didSet{
            headerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner  ]
        }
    }
    @IBOutlet weak var messageTableView: UITableView!{
        didSet{
            messageTableView.rowHeight = 88
        }
    }
    @IBOutlet weak var messageView: CardCusstomView!
    var parentMessages : ParentMessages?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        messageView.layer.cornerRadius = 20
        setUpTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getChatData(id: UserDefault.getId())
    }


}
