//
//  SingleChat+TableDelagte.swift
//  Halima
//
//  Created by Moustafa on 7/17/21.
//

import UIKit
//MARK: - Extension

//MARK:-UICollectionViewDelegate And UICollectionViewDataSource

extension SingleChatViewController : UITableViewDelegate , UITableViewDataSource {
    
    func setUpTableView(){
        singleChatTableView.delegate = self
        singleChatTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SingleChatTableViewCell", for: indexPath) as! SingleChatTableViewCell
        let cellIndex = indexPath.item
        
        print(cellIndex)
        cell.configTableCell(data: messages, index: cellIndex)
        
        
        return cell
    }
    
    
}
