//
//  SingleChat+Func.swift
//  Halima
//
//  Created by Moustafa on 7/17/21.
//

import UIKit
//MARK: - Extension


extension SingleChatViewController  : ShowAlertProtocol {
    
    func completeData()  {
        messageTf.clipsToBounds = true
        if let parent = parents {
            if let image = parent.image {
                incubatorOrNurseriesImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "NoImage"))
            }
            if let name = parent.username {
                incubatorOrNurseriesNameLbl.text = name
            }
            
        }
    }
    
    
}
