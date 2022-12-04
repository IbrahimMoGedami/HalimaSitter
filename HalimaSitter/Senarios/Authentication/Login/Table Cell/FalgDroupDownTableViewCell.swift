//
//  FalgDroupDownTableViewCell.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit
import SDWebImage
class FalgDroupDownTableViewCell: UITableViewCell {
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var codeTextLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configTableCell(  data: [CountrtData] , index : Int)  {
        if let image = data[index].icon {
            flagImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "NoImage"))
        }
        
        if let code = data[index].phoneKey {
            codeTextLbl.text = code
        }
    }

}
