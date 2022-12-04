//
//  SingleChat+SendMessage.swift
//  Halima
//
//  Created by Moustafa on 7/17/21.
//

import UIKit
import Firebase
import NVActivityIndicatorView

//MARK: - Extension


extension SingleChatViewController    {
    
    func sendMessage(userId : Int  , sitterId : Int , senderId : Int ,   message : String , timeMessage : String ,   callback: @escaping (String) -> Void ,  failureHandler: @escaping (Error) -> Void  )  {
        let messagesDB = Database.database().reference().child("Chat")
        let chat = messagesDB.child("User\(userId)_Sitter\(sitterId)").childByAutoId()
        let messageArray : [String : Any] = ["senderId" : senderId , "userId" : userId , "sitterId" : sitterId ,  "messageText" : message , "messageTime" : timeMessage  ]
        
        chat.setValue(messageArray){ (error , msg) in
            if error == nil {
                callback("Message Send")
            }
        }
        
    }
    
    func getSendMessage(userId : Int  , sitterId : Int , senderId : Int , message : String , timeMessage : String  )  {
        sendMessage(userId : userId  , sitterId : sitterId, senderId: senderId ,  message : message , timeMessage : timeMessage,  callback:{ [weak self] (result)  in
            guard let self = self else {return}
            print(result)
            self.messageTf.text = ""
            self.singleChatTableView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
        
 
    }
    
}
