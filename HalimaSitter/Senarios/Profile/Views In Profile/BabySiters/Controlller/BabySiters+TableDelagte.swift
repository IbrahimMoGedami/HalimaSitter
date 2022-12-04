//
//  BabySiters+TableDelagte.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import UIKit

extension BabySitersViewController: UITableViewDelegate, UITableViewDataSource  {
  
    
    
    func setUpTableView(){
        babySitersTableView.delegate = self
        babySitersTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return babySiters?.data?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "BabySitersTableViewCell", for: indexPath) as! BabySitersTableViewCell
        if let data = babySiters?.data {
            cell.configTableCell(data: data, index: cellIndex)
        }
        cell.roomAction = self
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
