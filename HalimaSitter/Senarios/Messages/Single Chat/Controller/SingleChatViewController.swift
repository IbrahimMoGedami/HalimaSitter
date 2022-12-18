//
//  SingleChatViewController.swift
//  Halima
//
//  Created by Moustafa on 7/17/21.
//

import UIKit
import AgoraRtmKit

class SingleChatViewController: UIViewController {
    
    @IBOutlet weak var incubatorOrNurseriesNameLbl: UILabel!
    @IBOutlet weak var incubatorOrNurseriesImage: UIImageView!
    @IBOutlet weak var headerView: UIView!{
        didSet{
            headerView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner  ]
        }
    }
    @IBOutlet weak var messageTf: UITextField!
    @IBOutlet weak var singleChatTableView: UITableView!
    var parents: Parent?

    var  messages = [Messages]()
    
//    lazy var appleCallKit = CallCenter(delegate: self)
    var callerNumber: String?
    
    var prepareToVideoChat: (() -> ())?
    var localNumber : String?
    var remotNumber  = "2222"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completeData()
        setUpTableView()
        //    statrAgora()
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let id = parents?.id {
            remotNumber = "00\(id)"
            getMessageObseerve(userId: id, sitterId: UserDefault.getId())
            let rtm = AgoraRtm.shared()
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/rtm.log"
            rtm.setLogPath(path)
//            rtm.inviterDelegate = self
            // create local number
            let rand = arc4random_uniform(UInt32(9999 + 1 - 1000)) + 1000
            // localNumber = "\(rand)"
            localNumber = "11\(UserDefault.getId())"
            
            
            // rtm login
            guard let localNumber = localNumber else {
                fatalError("localNumber nil")
            }
            
            guard let kit = AgoraRtm.shared().kit else {
//                self.showAlert("AgoraRtmKit nil")
                return
            }
            
            kit.login(account: localNumber, token: nil) { [unowned self] (error) in
//                self.showAlert(error.localizedDescription)
            }
        }
        
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendMessageBtnPressed(_ sender: UIButton) {
        let date = Date()
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        let hour =  calendar.component(.hour, from: date)
        if let message =  messageTf.text   , !message.isEmpty {
            if let id = parents?.id {
                getSendMessage(userId: id, sitterId: UserDefault.getId(), senderId: UserDefault.getId(), message: message, timeMessage: "\(hour):\(minutes)")
            }
        }else{
            Alert.show("Error".localized, massege: "chat1".localized, context: self)
        }
    }
    @IBAction func voiseCallBtnPressed(_ sender: UIButton) {
        print(parents?.id) 
        getAgoraToken(parentId: parents?.id ?? 0, type: .voice)
    }
    
    @IBAction func videoCallBtnPressed(_ sender: UIButton) {
//        let vc = AppStoryboard.Calling.viewController(viewControllerClass: VideoCallViewController.self)
//        if let localNumber = localNumber  {
//        vc.localNumber = localNumber
//        vc.remoteNumber = "\(remotNumber)"
//        vc.delegate = self
//        callingVC(vc, startOutgoing: "\(remotNumber)")
//        present(vc, animated: true, completion: nil)
//        }
        print(parents?.id)
        getAgoraToken(parentId: parents?.id ?? 0, type: .video)
        
    }
}
