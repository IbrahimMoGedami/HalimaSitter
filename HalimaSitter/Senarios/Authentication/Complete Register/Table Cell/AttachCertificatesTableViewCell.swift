//
//  AttachCertificatesTableViewCell.swift
//  HalimaSitter
//
//  Created by Moustafa on 03/08/2021.
//

import UIKit

class AttachCertificatesTableViewCell: UITableViewCell {

    @IBOutlet weak var attachName: UILabel!
    @IBOutlet weak var attachImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configTableCell(  data: [Attach] , index : Int)  {
        
        
        if let type = data[index].type {
            switch type {
            case 1:
                attachImage.image = UIImage(named: "certificate")
                if let name = data[index].text {
                attachName.text = name
                }
            case 2:
                attachImage.image = UIImage(named: "diploma")
                if let name = data[index].text {
                attachName.text = name
                }
            default:
                print("xx")
            }
        }
 
    }

}
