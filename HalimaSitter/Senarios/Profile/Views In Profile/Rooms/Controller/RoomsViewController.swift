//
//  RoomsViewController.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import UIKit

class RoomsViewController: UIViewController {

    @IBOutlet weak var noRoomView: UIView!
    @IBOutlet weak var roomsTableView: UITableView!{
        didSet{
            roomsTableView.rowHeight = 70
        }
    }
    var rooms : Rooms?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getRoom()

    }
    
    @IBAction func addNewRoomBtnPressed(_ sender: UIButton) {
        goToAddRoom()
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
