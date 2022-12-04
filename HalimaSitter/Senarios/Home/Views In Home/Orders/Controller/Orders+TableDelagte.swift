//
//  Orders+TableDelagte.swift
//  Halima
//
//  Created by Moustafa on 7/11/21.
//

import UIKit

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource  {
    
    
    
    func setUpTableView(){
        previousOrdersTableView.delegate = self
        previousOrdersTableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch flag {
        case 1:
            return myOrders?.data?.ordersCurrent?.count ?? 0
        case 2:
            return  myOrders?.data?.reservations?.count ?? 0
        case 3:
            return  myOrders?.data?.ordersLast?.count ?? 0
        default:
            return 10
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIndex = indexPath.row
        switch flag {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousOrdersTableViewCell", for: indexPath) as! PreviousOrdersTableViewCell
            if let data = myOrders?.data?.ordersCurrent {
                cell.configTableCell(data: data, index: cellIndex)
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousOrdersTableViewCell", for: indexPath) as! PreviousOrdersTableViewCell
            if let data = myOrders?.data?.reservations {
                cell.configTableCell(data: data, index: cellIndex)
            }
            cell.rateViewPopup = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousOrdersTableViewCell", for: indexPath) as! PreviousOrdersTableViewCell
            if let data = myOrders?.data?.ordersLast {
                cell.configTableCell(data: data, index: cellIndex)
            }
            cell.rateViewPopup = self
            return cell
        default:
            return UITableViewCell()
        }
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch flag {
        case 1:
            if let singleOrder = myOrders?.data?.ordersCurrent?[indexPath.row] {
                goToCurrentOrderDetailes(singleOrder: singleOrder)
            }
        case 2:
            if let singleOrder = myOrders?.data?.reservations?[indexPath.row] {
                goToCurrentOrderDetailes(singleOrder: singleOrder)
            }
        case 3:
            if let singleOrder = myOrders?.data?.ordersLast?[indexPath.row] {
                goToCurrentOrderDetailes(singleOrder: singleOrder)
            }
        default:
            print("xx")
        }
        
    }
    
    
}
