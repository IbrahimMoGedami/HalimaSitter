//
//  VideoCallViewController.swift
//  Halima
//
//  Created by Moustafa on 15/08/2021.
//

import UIKit
//import AgoraRtcKit


protocol VideoChatVCDelegate: NSObjectProtocol {
    func videoChat(_ vc: VideoCallViewController, didEndChatWith uid: UInt)
    func voiceChat(_ vc: VoiceViewController, didEndChatWith uid: UInt)

}
class VideoCallViewController: UIViewController {

    @IBOutlet weak var localeView: UIView!
    @IBOutlet weak var remoteView: UIView!
    
    @IBOutlet weak var remoteVideoMutedIndicator: UIImageView!
    @IBOutlet weak var localVideoMutedIndicator: UIView!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    
//    private var isRemoteVideoRender: Bool = true {
//        didSet {
//            remoteVideoMutedIndicator.isHidden = isRemoteVideoRender
//            remoteView.isHidden = !isRemoteVideoRender
//        }
//    }
//
//    private var isLocalVideoRender: Bool = false {
//        didSet {
//            localVideoMutedIndicator.isHidden = isLocalVideoRender
//        }
//    }
//
//    private var isStartCalling: Bool = true {
//        didSet {
//            if isStartCalling {
//                micButton.isSelected = false
//            }
//            micButton.isHidden = !isStartCalling
//            cameraButton.isHidden = !isStartCalling
//        }
//    }
//
//    var agoraKit : AgoraRtcEngineKit?
//    var channel: String?
//    var remoteUid: UInt?
//    weak var delegate: VideoChatVCDelegate?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        initializeAgoraEngine()
//        setupLocalVideo()
//        joinChannel()
//        // Do any additional setup after loading the view.
//    }
//
//    func initializeAgoraEngine(){
//        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: KeyCenter.AppId, delegate: self)
//
//    }
//
//    func setupLocalVideo(){
//        agoraKit?.enableVideo()
//        let videoCanves = AgoraRtcVideoCanvas()
//        videoCanves.uid = 0
//        videoCanves.view = localeView
//        videoCanves.renderMode = .hidden
//        agoraKit?.setupLocalVideo(videoCanves)
//    }
//
//    func joinChannel(){
//        agoraKit?.joinChannel(byToken: nil, channelId: channel!, info: nil, uid: 0, joinSuccess:
//                    {(channel , uid , elapsed) in
//
//                       print("Success \(channel)")
//                        self.isLocalVideoRender = true
//
//                    })
//
//    }
//
//    func leaveChannel(){
//
//        if let remoteUid = remoteUid {
//            agoraKit?.leaveChannel(nil)
//            localeView.isHidden = true
//            remoteView.isHidden = true
//            isLocalVideoRender = false
//            isRemoteVideoRender = false
//            delegate?.videoChat(self, didEndChatWith: remoteUid)
//            UIApplication.shared.isIdleTimerDisabled = false
//        }
//
//
//
//    }
//
//
    
    @IBAction func didClickHangUpButton(_ sender: UIButton) {
//        leaveChannel()
    }
    
    @IBAction func didClickMuteButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        // mute local audio
//        agoraKit?.muteLocalAudioStream(sender.isSelected)
    }
    
    @IBAction func didClickSwitchCameraButton(_ sender: UIButton) {
        sender.isSelected.toggle()
//        agoraKit?.switchCamera()
    }
    
}



//extension VideoCallViewController : AgoraRtcEngineDelegate {
//    func rtcEngine(_ engine: AgoraRtcEngineKit, firstRemoteVideoDecodedOfUid uid: UInt, size: CGSize, elapsed: Int) {
//        let videoCanves = AgoraRtcVideoCanvas()
//        videoCanves.uid = uid
//        videoCanves.view = remoteView
//        videoCanves.renderMode = .hidden
//        isRemoteVideoRender = true
//
//        agoraKit?.setupRemoteVideo(videoCanves)
//    }
//    
//    
//    
//    func rtcEngine(_ engine: AgoraRtcEngineKit, didVideoMuted muted: Bool, byUid: UInt) {
//        isRemoteVideoRender = !muted
//    }
//    
//}
