//
//  PreviousOrdersTableViewCell.swift
//  Halima
//
//  Created by Moustafa on 7/11/21.
//

import UIKit

protocol RateViewPopup {
    func goToRate(singleOrder : SingleOrder)
}
class PreviousOrdersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var childCountView: UIView!
    @IBOutlet weak var childCount: UILabel!
    @IBOutlet weak var orderStatsView: UIView!
    @IBOutlet weak var addRateBtn: UIButton!
    @IBOutlet weak var orderStatsLbl: UILabel!
    @IBOutlet weak var incubatorOrNurseriesRateLbl: UILabel!
    @IBOutlet weak var incubatorOrNurseriesAddressLbl: UILabel!
    @IBOutlet weak var incubatorOrNurseriesNameLbl: UILabel!
    @IBOutlet weak var incubatorOrNurseriesImage: UIImageView!
    var rateViewPopup : RateViewPopup?
    var singleOrder : SingleOrder?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configTableCell(  data: [SingleOrder] , index : Int)  {
        
        self.singleOrder = data[index]
        if let image = data[index].parent?.image {
            incubatorOrNurseriesImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "NoImage"))
        }
        
        
        if let name = data[index].parent?.username {
            incubatorOrNurseriesNameLbl.text = name
        }
        
        if let address = data[index].address {
            incubatorOrNurseriesAddressLbl.text = address
        }
        if let count = data[index].child?.count {
            childCount.text = "\(count)"
        }
        
        if let rate = data[index].parent?.rate {
            incubatorOrNurseriesRateLbl.text = "\(rate)"
        }
        
        if let stats = data[index].status {
            switch stats {
            case 1:
                addRateBtn.isHidden = true
                childCountView.isHidden = false
                changeOrderStats(textColor: "MainColor", borderColor: "MainColor", bgColor: "Bg", text: "new".localized)
            case 2:
                addRateBtn.isHidden = true
                childCountView.isHidden = false
                changeOrderStats(textColor: "Bg", borderColor: "MainColor", bgColor: "MainColor", text: "accepted".localized)
            case 3:
                addRateBtn.isHidden = true
                childCountView.isHidden = false
                changeOrderStats(textColor: "Bg", borderColor: "BorderColor1", bgColor: "BorderColor1", text: "rejected".localized)
            case 4:
                addRateBtn.isHidden = false
                childCountView.isHidden = true
                changeOrderStats(textColor: "Bg", borderColor: "MainColor", bgColor: "MainColor", text: "completed".localized)
            case 5:
                addRateBtn.isHidden = true
                childCountView.isHidden = false
                changeOrderStats(textColor: "Bg", borderColor: "MainColor", bgColor: "MainColor", text: "started".localized)
            case 6:
                addRateBtn.isHidden = true
                childCountView.isHidden = false
                changeOrderStats(textColor: "Bg", borderColor: "BorderColor1", bgColor: "BorderColor1", text: "canceled".localized)
            case 7:
                addRateBtn.isHidden = true
                childCountView.isHidden = false
                changeOrderStats(textColor: "MainColor", borderColor: "MainColor", bgColor: "Bg", text: "endBySitter".localized)
                
                
            default:
                print("xx")
            }
        }
        
        
    }
    
    
    func changeOrderStats ( textColor : String , borderColor : String , bgColor : String ,  text : String  ) {
        
        orderStatsView.backgroundColor = UIColor(named: bgColor)
        orderStatsView.borderColor = UIColor(named: borderColor)
        orderStatsLbl.text = text
        orderStatsLbl.textColor = UIColor(named: textColor)
        
    }
    
    @IBAction func addRateBtnPressed(_ sender: UIButton) {
        if let singleOrder = singleOrder {
            rateViewPopup?.goToRate(singleOrder: singleOrder)
        }
    }
}
