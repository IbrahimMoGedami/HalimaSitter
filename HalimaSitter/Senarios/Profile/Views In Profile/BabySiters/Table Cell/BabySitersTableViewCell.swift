//
//  BabySitersTableViewCell.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import UIKit

class BabySitersTableViewCell: UITableViewCell {

    @IBOutlet weak var babySiterNameLbl: UILabel!
    
    var roomAction : RoomAction?
    var index : Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configTableCell(  data: [BabySiterData] , index : Int)  {
        
        
        if let name = data[index].name {
            babySiterNameLbl.text = name
        }
        self.index = index
    }
   
    
    @IBAction func delateBtnPressed(_ sender: UIButton) {
        if let index = index {
            roomAction?.delete(index: index)
        }
    }
}
