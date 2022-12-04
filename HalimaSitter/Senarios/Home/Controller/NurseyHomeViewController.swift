//
//  NurseyHomeViewController.swift
//  HalimaSitter
//
//  Created by Moustafa on 04/08/2021.
//

import UIKit

class NurseyHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    
    
    @IBAction func orderBtnPressed(_ sender: UIButton) {
        
        let vc = AppStoryboard.Orders.viewController(viewControllerClass: OrdersViewController.self)
        vc.modalPresentationStyle = .fullScreen
        vc.flag = sender.tag
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func menuBtnPressed(_ sender: UIButton) {
        let vc = AppStoryboard.Menu.viewController(viewControllerClass: MenuViewController.self)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
