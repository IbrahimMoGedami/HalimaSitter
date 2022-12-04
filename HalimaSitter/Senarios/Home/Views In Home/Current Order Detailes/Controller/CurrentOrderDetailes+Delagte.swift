//
//  CurrentOrderDetailes+Delagte.swift
//  HalimaSitter
//
//  Created by Moustafa on 09/08/2021.
//

import UIKit

extension CurrentOrderDetailesViewController: UITableViewDelegate, UITableViewDataSource  {
  
    
    
    func setUpTableView(){
        orderDetailesTableDelagte.delegate = self
        orderDetailesTableDelagte.dataSource = self
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return singleOrder?.child?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIndex = indexPath.row

        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderChildernTableViewCell", for: indexPath) as! OrderChildernTableViewCell
        if let data = singleOrder?.child {
            cell.configTableCell(data: data, index: cellIndex)
        }
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    
}
