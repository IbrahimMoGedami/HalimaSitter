//
//  Messages+TableDeagte.swift
//  Halima
//
//  Created by Moustafa on 7/17/21.
//

import UIKit

extension MessagesViewController: UITableViewDelegate, UITableViewDataSource   {

    func setUpTableView(){
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return parentMessages?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIndex = indexPath.row

        let cell = tableView.dequeueReusableCell(withIdentifier: "MessagesTableViewCell", for: indexPath) as! MessagesTableViewCell
        if let data = parentMessages?.data {
            cell.configTableCell(data: data, index: cellIndex)
        }

        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AppStoryboard.SingleChat.viewController(viewControllerClass: SingleChatViewController.self)
        vc.modalPresentationStyle = .fullScreen
        if let parent = parentMessages?.data?[indexPath.row] {
            vc.parents = parent
        navigationController?.pushViewController(vc, animated: true)
        }
    }

}
