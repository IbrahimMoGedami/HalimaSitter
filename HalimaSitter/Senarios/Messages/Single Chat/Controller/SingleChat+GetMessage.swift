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
enum AgoraType: String, Codable{
    case video
    case voice
}
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
    
    
    func getAgoraToken(parentId: Int, type: AgoraType) {
        self.startAnimating()
        Services.getAgoraTokenApi(parentId: parentId, type: type) { respose, status in
            self.stopAnimating()
            if  respose.status == 1 {
                switch type {
                case .video:
                    let vc = AppStoryboard.Video.viewController(viewControllerClass: VideoCallViewController.self)
                    vc.AgoraChanelName = respose.data?.channelName ?? ""
                    vc.AgoraToken = respose.data?.token
                    self.present(vc, animated: true, completion: nil)
                case .voice:
                    let vc = AppStoryboard.Voice.viewController(viewControllerClass: VoiceViewController.self)
                    vc.AgoraChanelName = respose.data?.channelName ?? ""
                    vc.agoraToken = respose.data?.token ?? ""
                    self.present(vc, animated: true, completion: nil)
                }
               
            }
        } failureHandler: { error, dd in
            
        }

//        Services.getAgoraTokenApi(parentId: parentId) { (result, state) in
//            guard let self = self else {return}
//            self.stopAnimating()
//            print(result)
//            if  result.status == 1 {
////                let vc = AppStoryboard.Calling.viewController(viewControllerClass: VideoCallViewController.self)
////                if let localNumber = localNumber  {
////                    vc. = localNumber
////                vc.remoteNumber = "\(remotNumber)"
////                vc.delegate = self
////                callingVC(vc, startOutgoing: "\(remotNumber)")
////                present(vc, animated: true, completion: nil)
////                }
//
//                let vc = AppStoryboard.Video.viewController(viewControllerClass: VideoCallViewController.self)
//                vc.channel = result.data?.channelName
//                vc.parents?.token
//
//            }
//        } failureHandler: { (error,stats) in
//            print("stats code is \(stats)")
//            self.stopAnimating()
//            print(error.localizedDescription)
//        }

    }
    
    
    /*
     
     { [weak self] (result,stats)  in
         guard let self = self else {return}
         self.stopAnimating()
         print(result)
         print("stats code is \(stats)")
         if  result.status == 1 {
             self.myNotification = result
             self.notificationTableView.reloadData()
             self.checkNoti()
         }
         
     }) { (error,stats) in
         print("stats code is \(stats)")
         self.stopAnimating()
         print(error.localizedDescription)
     }
     
     */
    
}
