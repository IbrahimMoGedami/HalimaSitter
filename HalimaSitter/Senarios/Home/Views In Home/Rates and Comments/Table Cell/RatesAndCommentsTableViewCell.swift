//
//  RatesAndCommentsTableViewCell.swift
//  Halima
//
//  Created by Moustafa on 7/11/21.
//

import UIKit
import Cosmos
class RatesAndCommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var raterRate: CosmosView!
    @IBOutlet weak var raterCommentLbl: UILabel!
    @IBOutlet weak var raterTimeLbl: UILabel!
    @IBOutlet weak var raterNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configTableCell(  data: [Rate] , index : Int)  {
        
        if let name = data[index].name {
            raterNameLbl.text = name
        }
        if let createdAt = data[index].createdAt {
            raterTimeLbl.text = createdAt
        }
        if let comment = data[index].comment {
            raterCommentLbl.text = comment
        }
        if let rate = data[index].rate {
            raterRate.rating = Double(rate)
        }
    }
        

}
