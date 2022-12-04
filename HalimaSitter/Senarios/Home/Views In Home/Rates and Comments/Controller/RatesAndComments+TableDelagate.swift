//
//  RatesAndComments+TableDelagate.swift
//  Halima
//
//  Created by Moustafa on 7/11/21.
//

import UIKit

extension RatesAndCommentsViewController: UITableViewDelegate, UITableViewDataSource  {
  
    
    
    func setUpTableView(){
        ratesAndCommentsTablleView.delegate = self
        ratesAndCommentsTablleView.dataSource = self
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return userRate?.data?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIndex = indexPath.row

        let cell = tableView.dequeueReusableCell(withIdentifier: "RatesAndCommentsTableViewCell", for: indexPath) as! RatesAndCommentsTableViewCell
        if let data = userRate?.data {
            cell.configTableCell(data: data, index: cellIndex)
        }
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    
}
