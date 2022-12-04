//
//  Notification+TableDelagte.swift
//  Halima
//
//  Created by Moustafa on 7/8/21.
//

import UIKit

extension NotificationViewController: UITableViewDelegate, UITableViewDataSource  {


    
    func setUpTableView(){
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return myNotification?.data?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIndex = indexPath.row

        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        if let data = myNotification?.data {
            cell.configTableCell(data: data, index: cellIndex)
        }
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let singleOrder = myNotification?.data?[indexPath.row].order {
            goToOrderDetailes(singleOrder: singleOrder)
        }
    }
    
    
}
