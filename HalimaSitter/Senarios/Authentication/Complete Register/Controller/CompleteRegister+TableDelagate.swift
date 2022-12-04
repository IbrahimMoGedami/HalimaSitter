//
//  CompleteRegister+TableDelagate.swift
//  HalimaSitter
//
//  Created by Moustafa on 03/08/2021.
//

import UIKit

extension CompleteRegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpTableView(){
        attachCertificatesTableView.delegate = self
        attachCertificatesTableView.dataSource = self
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return attach.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttachCertificatesTableViewCell", for: indexPath) as! AttachCertificatesTableViewCell
            cell.configTableCell(data: attach, index: cellIndex)
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
    }
    
    
}
