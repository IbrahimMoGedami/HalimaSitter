//
//  Register+TableDelagte.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit

extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpTableView(){
        flagTableView.delegate = self
        flagTableView.dataSource = self
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countries?.data?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "FalgDroupDownTableViewCell", for: indexPath) as! FalgDroupDownTableViewCell
        if let data = countries?.data {
            cell.configTableCell(data: data, index: cellIndex)
        }
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        let cellIndex = indexPath.row


        if let count = countries?.data?[cellIndex].phoneNum {
            numberCount = count

        }
        if let code = countries?.data?[cellIndex].id {
            countryId = code
        }
        if let codeCountry = countries?.data?[cellIndex].phoneKey {
            countryCodeLbl.text = codeCountry
        }
        animate(toogle: false, type: flagBtn)


    }
    
    
}
