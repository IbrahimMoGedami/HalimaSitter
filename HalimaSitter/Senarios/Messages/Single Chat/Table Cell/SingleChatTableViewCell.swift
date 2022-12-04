//
//  SingleChatTableViewCell.swift
//  Halima
//
//  Created by Moustafa on 7/17/21.
//

import UIKit

class SingleChatTableViewCell: UITableViewCell {

   
    @IBOutlet weak var slackChat: UIStackView!
    @IBOutlet weak var messageChatLbl: UILabel!{
        didSet{
            messageChatLbl.layer.cornerRadius = 8
            messageChatLbl.clipsToBounds = true
        }}
    @IBOutlet weak var timeMessage: UILabel!{
        didSet{
           // timeMessage.layoutMargins.right
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configTableCell(  data: [Messages] , index : Int)  {

        messageChatLbl.text = data[index].message
        timeMessage.text = data[index].messageTime
        if UserDefault.getId() == data[index].senderId {
            slackChat.alignment = .leading
            messageChatLbl.backgroundColor = UIColor(named: "UserChatBackGroundColor")
            messageChatLbl.textColor = UIColor(named: "UserChatColor")
        }else{
            slackChat.alignment = .trailing
            messageChatLbl.backgroundColor = UIColor(named: "MainColor")
            messageChatLbl.textColor = UIColor.white
        }
    }

}
