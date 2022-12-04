//
//  SingleChat+Agora.swift
//  Halima
//
//  Created by Moustafa on 15/08/2021.
//

import UIKit
import AgoraRtmKit


extension SingleChatViewController : AgoraRtmCallDelegate   {
    
    func statrAgora()  {
        
        let rtm = AgoraRtm.shared()
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/rtm.log"
        rtm.setLogPath(path)
        rtm.inviterDelegate = self
        // create local number
        localNumber = "11\(UserDefault.getId())"

        // rtm login
        guard let localNumber = localNumber else {
            fatalError("localNumber nil")
        }
        
        guard let kit = AgoraRtm.shared().kit else {
            self.showAlert("AgoraRtmKit nil")
            return
        }
        
        kit.login(account: localNumber, token: nil) { [unowned self] (error) in
            self.showAlert(error.localizedDescription)
        }
    }
}

 extension SingleChatViewController {
    func callingVC(_ vc: CallingViewController, startOutgoing numbers: String?) {
        guard let remoteNumber = numbers else {
            fatalError("remoteNumber nil")
        }
        
        appleCallKit.startOutgoingCall(of: "\(remotNumber)")
        
    }
}





extension SingleChatViewController: CallingVCDelegate {
    func callingVC(_ vc: CallingViewController, didHungup reason: HungupReason) {
        vc.dismiss(animated: reason == .toVideoChat ? false : true) { [unowned self] in
            switch reason {
            case .error:
                self.showAlert(reason.description)
            case .remoteReject(let remote):
                self.appleCallKit.endCall(of: remote)
                self.showAlert(reason.description + ": \(remote)")
            case .normaly(let remote):
                guard let inviter = AgoraRtm.shared().inviter else {
                    fatalError("rtm inviter nil")
                }
                
                let errorHandle: ErrorCompletion = { [weak self] (error: AGEError) in
                    self?.showAlert(error.localizedDescription)
                }
                
                switch inviter.status {
                case .outgoing:
                    self.appleCallKit.endCall(of: remote)
                    inviter.cancelLastOutgoingInvitation(fail: errorHandle)
                default:
                    break
                }
            default:
                break
            }
        }
    }
}



extension SingleChatViewController: CallCenterDelegate {
    func callCenter(_ callCenter: CallCenter, answerCall session: String) {
        print("callCenter answerCall")
        
        guard let inviter = AgoraRtm.shared().inviter else {
            fatalError("rtm inviter nil")
        }
      

        guard let channel = inviter.lastIncomingInvitation?.content else {
            fatalError("lastIncomingInvitation content nil")
        
        }
        print(channel)
        
        guard let remote = UInt(session) else {
            fatalError("string to int fail")
            print(remotNumber)
            print(localNumber)
        }
        
        inviter.accpetLastIncomingInvitation()
        
//        if let caller = inviter.lastIncomingInvitation?.caller {
//            let first2 = String(caller.prefix(2))
//            if first2 == "\(voiceCode)" {
//                var data: (channel: String, remote: UInt)
//                data.channel = channel
//                data.remote = remote
//                let vc = AppStoryboard.Voice.viewController(viewControllerClass: VoiceViewController.self)
//                vc.modalPresentationStyle = .fullScreen
//                vc.remoteUid = data.remote
//                vc.channel = channel
//                vc.delegate = self
//                self.present(vc, animated: true, completion: nil)
//            }else if first2 == "\(videoCode)" {
//
//            }
//
//        }
        
        var data: (channel: String, remote: UInt)
        data.channel = channel
        data.remote = remote
        let vc = AppStoryboard.Video.viewController(viewControllerClass: VideoCallViewController.self)
        vc.modalPresentationStyle = .fullScreen
//        vc.remoteUid = data.remote
//        vc.channel = channel
//        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
     
    }
    
    func callCenter(_ callCenter: CallCenter, declineCall session: String) {
        print("callCenter declineCall")
        
        guard let inviter = AgoraRtm.shared().inviter else {
            fatalError("rtm inviter nil")
        }
        
        inviter.refuseLastIncomingInvitation {  [weak self] (error) in
            self?.showAlert(error.localizedDescription)
        }
    }
    
    func callCenter(_ callCenter: CallCenter, startCall session: String) {
        print("callCenter startCall")
        
        guard let kit = AgoraRtm.shared().kit else {
            fatalError("rtm kit nil")
        }
        
        guard let localNumber = localNumber else {
            fatalError("localNumber nil")
        }
        
        guard let inviter = AgoraRtm.shared().inviter else {
            fatalError("rtm inviter nil")
        }
        
        guard let vc = self.presentedViewController as? CallingViewController else {
            fatalError("CallingViewController nil")
        }
        
        let remoteNumber = session
        
        // rtm query online status
        kit.queryPeerOnline(remoteNumber, success: { [weak vc] (onlineStatus) in
            switch onlineStatus {
            case .online:      sendInvitation(remote: remoteNumber, callingVC: vc!)
            case .offline:     vc?.close(.remoteReject(remoteNumber))
            case .unreachable: vc?.close(.remoteReject(remoteNumber))
            @unknown default:  fatalError("queryPeerOnline")
            }
        }) { [weak vc] (error) in
            vc?.close(.error(error))
        }
        
        // rtm send invitation
        func sendInvitation(remote: String, callingVC: CallingViewController) {
            let channel = "\(localNumber)-\(remoteNumber)-\(Date().timeIntervalSinceReferenceDate)"
            
            inviter.sendInvitation(peer: remoteNumber, extraContent: channel, accepted: { [weak self, weak vc] in
                vc?.close(.toVideoChat)
                
                self?.appleCallKit.setCallConnected(of: remote)
                
                guard let remote = UInt(remoteNumber) else {
                    fatalError("string to int fail")
                }
                var data: (channel: String, remote: UInt)
                data.channel = channel
                data.remote = remote
                let vc = AppStoryboard.Video.viewController(viewControllerClass: VideoCallViewController.self)
                vc.modalPresentationStyle = .fullScreen
//                vc.remoteUid = data.remote
//                vc.channel = channel
//                vc.delegate = self
                self?.present(vc, animated: true, completion: nil)
            }, refused: { [weak vc] in
                vc?.close(.remoteReject(remoteNumber))
            }) { [weak vc] (error) in
                vc?.close(.error(error))
            }
        }
    }
    
    func callCenter(_ callCenter: CallCenter, muteCall muted: Bool, session: String) {
        print("callCenter muteCall")
    }
    
    func callCenter(_ callCenter: CallCenter, endCall session: String) {
        print("callCenter endCall")
        self.prepareToVideoChat = nil
    }
    
    func callCenterDidActiveAudioSession(_ callCenter: CallCenter) {
        print("callCenter didActiveAudioSession")
        
        // Incoming call
        if let prepare = self.prepareToVideoChat {
            prepare()
        }
    }
}


extension SingleChatViewController: AgoraRtmInvitertDelegate {
    func inviter(_ inviter: AgoraRtmCallKit, didReceivedIncoming invitation: AgoraRtmInvitation) {
        appleCallKit.showIncomingCall(of: invitation.caller)
    }
    
    func inviter(_ inviter: AgoraRtmCallKit, remoteDidCancelIncoming invitation: AgoraRtmInvitation) {
        appleCallKit.endCall(of: invitation.caller)
        let vc = AppStoryboard.Video.viewController(viewControllerClass: VideoCallViewController.self)
//        vc.leaveChannel()
//        vc.delegate = self
        vc.dismiss(animated: true, completion: nil)
    }
}

extension SingleChatViewController: VideoChatVCDelegate {
    func voiceChat(_ vc: VoiceViewController, didEndChatWith uid: UInt) {
        appleCallKit.endCall(of: "\(uid)")
        vc.dismiss(animated: true, completion: nil)
    }
    
    func videoChat(_ vc: VideoCallViewController, didEndChatWith uid: UInt) {
        appleCallKit.endCall(of: "\(uid)")
        vc.dismiss(animated: true, completion: nil)
    }
}








protocol ShowAlertProtocol: UIViewController {
    func showAlert(_ message: String, handler: ((UIAlertAction) -> Void)?)
    func showAlert(_ message: String)
}

extension ShowAlertProtocol {
    func showAlert(_ message: String, handler: ((UIAlertAction) -> Void)?) {
        view.endEditing(true)
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(_ message: String) {
        showAlert(message, handler: nil)
    }
}
