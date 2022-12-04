//
//  VoiceViewController.swift
//  Halima
//
//  Created by Moustafa on 15/08/2021.
//

import UIKit
//import AgoraRtcKit

class VoiceViewController: UIViewController {
    
    @IBOutlet weak var controlButtonsView: UIView!
    
//    var agoraKit: AgoraRtcEngineKit!
//    var channel: String?
//    var remoteUid: UInt?
//    weak var delegate: VideoChatVCDelegate?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        initializeAgoraEngine()
//        joinChannel()
//    }
//
//    func initializeAgoraEngine() {
//        // Initializes the Agora engine with your app ID.
//        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: KeyCenter.AppId, delegate: nil)
//    }
//
//    func joinChannel() {
//        // Allows a user to join a channel.
//
//
//
//        agoraKit?.joinChannel(byToken: nil, channelId: channel!, info: nil, uid: 0, joinSuccess:
//                                {(channel , uid , elapsed) in
//
//                                    print("Success \(channel)")
//                                    self.agoraKit.setEnableSpeakerphone(true)
//                                    UIApplication.shared.isIdleTimerDisabled = true
//                                })
//    }
//
    @IBAction func didClickHangUpButton(_ sender: UIButton) {
//        leaveChannel()
    }
    
//    func leaveChannel() {
//        if let remoteUid = remoteUid {
//            agoraKit.leaveChannel(nil)
//            hideControlButtons()
//            UIApplication.shared.isIdleTimerDisabled = false
//            delegate?.voiceChat(self, didEndChatWith: remoteUid)
//        }
//
//
//        agoraKit.leaveChannel(nil)
//        hideControlButtons()
//
//        UIApplication.shared.isIdleTimerDisabled = false
//    }
//
    func hideControlButtons() {
        controlButtonsView.isHidden = true
    }
    
    @IBAction func didClickMuteButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        // Stops/Resumes sending the local audio stream.
//        agoraKit.muteLocalAudioStream(sender.isSelected)
    }
    
    @IBAction func didClickSwitchSpeakerButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        // Enables/Disables the audio playback route to the speakerphone.
        //
        // This method sets whether the audio is routed to the speakerphone or earpiece. After calling this method, the SDK returns the onAudioRouteChanged callback to indicate the changes.
//        agoraKit.setEnableSpeakerphone(sender.isSelected)
    }
    
}
