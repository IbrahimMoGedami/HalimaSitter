//
//  MessagesTableViewCell.swift
//  Halima
//
//  Created by Moustafa on 7/17/21.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {
    @IBOutlet weak var incubatorOrNurseriesNameLbl: UILabel!
    @IBOutlet weak var incubatorOrNurseriesImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configTableCell(  data: [Parent] , index : Int)  {
        
        if let image = data[index].image {
            incubatorOrNurseriesImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "NoImage"))
        }
        
        
        if let name = data[index].username {
            incubatorOrNurseriesNameLbl.text = name
        }
        
        
        
    }
    
}
