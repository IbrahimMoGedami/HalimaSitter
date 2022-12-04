//
//  SingleChat+GetMessage.swift
//  Halima
//
//  Created by Moustafa on 7/17/21.
//

import UIKit
import Firebase
import NVActivityIndicatorView

//MARK: - Extension

//MARK:-UICollectionViewDelegate And UICollectionViewDataSource

extension SingleChatViewController : NVActivityIndicatorViewable   {
  
    func getAllMessageObseerve( sitterId : Int  , userId : Int  , callback: @escaping (Messages) -> Void ,  failureHandler: @escaping (Error) -> Void  )  {
        let messagesDB = Database.database().reference().child("Chat")
        messagesDB.child("User\(userId)_Sitter\(sitterId)").observe(.childAdded){ (snapshot) in
            if let messagesArray = snapshot.value as? [String : Any] {
                if let userId = messagesArray["userId"] as? Int , let sitterId = messagesArray["sitterId"] as? Int , let messageText = messagesArray["messageText"] as? String , let timeMessage = messagesArray["messageTime"] as? String , let senderId = messagesArray["senderId"] as? Int {
                    let message = Messages(userId: userId, message: messageText, messageTime: timeMessage, senderId: senderId, sitterId: sitterId)
                    print(message)
                    callback(message)
                }
            }
        }
        
        
    }
    
    func getMessageObseerve(userId: Int , sitterId : Int){
        self.startAnimating()
        getAllMessageObseerve(sitterId: sitterId, userId: userId, callback: { [weak self] (result)  in
            guard let self = self else {return}
            self.stopAnimating()
            print(result)
            self.messages.append(result)
            self.singleChatTableView.reloadData()
            if self.messages.count > 0 {
                
            }
            let indexPath = NSIndexPath(row: self.messages.count-1, section: 0)
            self.singleChatTableView.scrollToRow(at: indexPath as IndexPath, at: .bottom, animated: true)
        }) { (error) in
            self.stopAnimating()
            print(error.localizedDescription)
            
        }
        self.stopAnimating()
    }
    
    
    
}
