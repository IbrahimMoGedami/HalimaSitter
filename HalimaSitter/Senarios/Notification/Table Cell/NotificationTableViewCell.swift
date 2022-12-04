//
//  NotificationTableViewCell.swift
//  Halima
//
//  Created by Moustafa on 7/8/21.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var notiTime: UILabel!
    @IBOutlet weak var notiData: UILabel!
    @IBOutlet weak var notiDes: UILabel!
    @IBOutlet weak var notiTiltle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configTableCell(  data: [NotificationData] , index : Int)  {
        
        
        if let title = data[index].title {
            notiTiltle.text = title
        }
        if let desc = data[index].desc {
            notiDes.text = desc
        }
        if let date = data[index].date {
            notiData.text = date
        }
        if let time = data[index].time {
            notiTime.text = time
        }
    }

}
