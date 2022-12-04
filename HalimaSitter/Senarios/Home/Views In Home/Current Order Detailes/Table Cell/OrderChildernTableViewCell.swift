//
//  OrderChildernTableViewCell.swift
//  Halima
//
//  Created by Moustafa on 7/12/21.
//

import UIKit

class OrderChildernTableViewCell: UITableViewCell {

    @IBOutlet weak var dataOfBrithLbl: UILabel!
    @IBOutlet weak var hobbyLbl: UILabel!
    @IBOutlet weak var doesLbl: UILabel!
    @IBOutlet weak var childNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configTableCell(  data: [Child] , index : Int)  {
        
        if let name = data[index].name {
            childNameLbl.text = name
        }
        if let haveIssue = data[index].haveIssue {
            switch haveIssue {
            case 1:
                doesLbl.text = "OrderDetailes1".localized
            case 2:
                doesLbl.text = "OrderDetailes2".localized
            default:
                print("xx")
            }
        }
        
        if let hobbies = data[index].hobbies {
            hobbyLbl.text = hobbies
        }
        
        if let dateOfBirth = data[index].dateOfBirth {
            dataOfBrithLbl.text = dateOfBirth
        }
        
    }

}
