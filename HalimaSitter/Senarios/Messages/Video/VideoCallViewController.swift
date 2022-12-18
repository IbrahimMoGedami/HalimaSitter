//
//  VideoCallViewController.swift
//  Halima
//
//  Created by Moustafa on 15/08/2021.
//

import UIKit
import AgoraRtcKit


class VideoCallViewController: UIViewController {
    
    @IBOutlet weak var connectiongView: UIView!
    @IBOutlet weak var connectiongLbl: UILabel!
    @IBOutlet weak var connectionProfileImage: UIImageView!
    
    @IBOutlet weak var localContainer: UIView!
    @IBOutlet weak var remoteContainer: UIView!
    
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var labelTimer: UILabel!
    
    var agoraKit   : AgoraRtcEngineKit?
    var localVideo : AgoraRtcVideoCanvas?
    var remoteVideo: AgoraRtcVideoCanvas?
    
    var orderId = 0
    let AgoraAppID: String = "8520cc1eb94d4253a4b65c50a1552bb3"
    var AgoraToken: String? = "006717b4ffb40934142a5cf340f1c63e20eIABJDYazZchYMLwGguXnHbqVNH0oXv63S3kTEqW1LbXF4rcjCWQAAAAAEADYCUcozJZTYAEAAQC2llNg"
    var AgoraChanelName: String = "test Agorw"
    
    var timer: Timer?
    var totalTime = 20
    var countTime = 0
    
    
    var isRemoteVideoRender: Bool = true {
        didSet {
            if let it = localVideo, let view = it.view {
                if view.superview == localContainer {
                    //                    remoteVideoMutedIndicator.isHidden = isRemoteVideoRender
                    remoteContainer.isHidden = !isRemoteVideoRender
                } else if view.superview == remoteContainer {
//                                        localVideoMutedIndicator.isHidden = isRemoteVideoRender
                }
            }
        }
    }
    
    var isLocalVideoRender: Bool = false {
        didSet {
            if let it = localVideo, let view = it.view {
                if view.superview == localContainer {
                    //                    localVideoMutedIndicator.isHidden = isLocalVideoRender
                } else if view.superview == remoteContainer {
                    //                    remoteVideoMutedIndicator.isHidden = isLocalVideoRender
                }
            }
        }
    }
    
    var isStartCalling: Bool = true {
        didSet {
            if isStartCalling {
                micButton.isSelected = false
            }
            micButton.isHidden = !isStartCalling
            cameraButton.isHidden = !isStartCalling
        }
    }
    
    private var isDraggind = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        connectiongView.isHidden = true
        initializeAgoraEngine()
        setupVideo()
        setupLocalVideo()
        joinChannel()
        
//        connectionProfileImage.load(with: AuthService.userData?.profileImage ?? "")
//        connectiongLbl.text = "Calling ....."
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
////        NotificationCenter.default.post(name: .HideTabBar, object: nil)
//        navigationController?.isNavigationBarHidden = true
//    }
    
    func initializeAgoraEngine() {
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: AgoraAppID, delegate: self)
    }
    
    func setupVideo() {
        agoraKit?.enableVideo()
        agoraKit?.setVideoEncoderConfiguration(AgoraVideoEncoderConfiguration(
            size: AgoraVideoDimension640x360,
            frameRate: .fps15,
            bitrate: AgoraVideoBitrateStandard,
            orientationMode: .adaptative))// mirrorMode: .enabled
       
    }
    
    func setupLocalVideo() {
        let view = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: localContainer.frame.size))
        localVideo = AgoraRtcVideoCanvas()
        localVideo?.view = view
        localVideo?.renderMode = .hidden
        localVideo?.uid = 0
        localContainer.addSubview(localVideo!.view!)
        agoraKit?.setupLocalVideo(localVideo)
        agoraKit?.startPreview()
    }
    
    func joinChannel() {
        agoraKit?.setDefaultAudioRouteToSpeakerphone(true)
        agoraKit?.joinChannel(byToken: AgoraToken, channelId: AgoraChanelName, info: nil, uid: 0) { [unowned self] (channel, uid, elapsed) -> Void in
            self.isLocalVideoRender = true
        }
        isStartCalling = true
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    func leaveChannel() {
        agoraKit?.leaveChannel(nil)
        isRemoteVideoRender = false
        isLocalVideoRender = false
        isStartCalling = false
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        handleLeaveChannel()
    }
    
    @IBAction func didClickHangUpButton(_ sender: UIButton) {
        self.handleLeaveChannel()
    }
    
    func handleLeaveChannel() {
        leaveChannel()
        _ = removeFromParent(localVideo)
        localVideo = nil
        _ = removeFromParent(remoteVideo)
        remoteVideo = nil
//        if let timer = self.timer {
//            timer.invalidate()
//            self.timer = nil
//        }
//        popMe()
        self.dismiss(animated: true)
    }
    
    @IBAction func didClickMuteButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        agoraKit?.muteLocalAudioStream(sender.isSelected)
    }
    
    @IBAction func didClickSwitchCameraButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        agoraKit?.switchCamera()
    }
    
    func removeFromParent(_ canvas: AgoraRtcVideoCanvas?) -> UIView? {
        if let it = canvas, let view = it.view {
            let parent = view.superview
            if parent != nil {
                view.removeFromSuperview()
                return parent
            }
        }
        return nil
    }
    
    func switchView(_ canvas: AgoraRtcVideoCanvas?) {
        let parent = removeFromParent(canvas)
        if parent == localContainer {
            canvas?.view!.frame.size = remoteContainer.frame.size
            remoteContainer.addSubview(canvas!.view!)
        } else if parent == remoteContainer {
            canvas?.view?.frame.size = localContainer.frame.size
            localContainer.addSubview(canvas!.view!)
        }
    }
}

extension VideoCallViewController: AgoraRtcEngineDelegate {
    
    func rtcEngine(_ engine: AgoraRtcEngineKit, firstRemoteVideoDecodedOfUid uid: UInt, size:CGSize, elapsed:Int) {
        isRemoteVideoRender = true
//        connectiongView.isHidden = true

        var parent: UIView = remoteContainer
        if let it = localVideo, let view = it.view {
            if view.superview == parent {
                parent = localContainer
            }
        }

        if remoteVideo != nil {
            return
        }

        let view = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: parent.frame.size))
        remoteVideo = AgoraRtcVideoCanvas()
        remoteVideo?.view = view
        remoteVideo?.renderMode = .hidden
        remoteVideo?.uid = uid
        parent.addSubview(remoteVideo!.view!)
        agoraKit?.setupRemoteVideo(remoteVideo!)
    }
    
    func rtcEngine(_ engine: AgoraRtcEngineKit, didOfflineOfUid uid:UInt, reason:AgoraUserOfflineReason) {
        isRemoteVideoRender = false
        if let it = remoteVideo, it.uid == uid {
            _ = removeFromParent(it)
            remoteVideo = nil
        }
    }
    
    func rtcEngine(_ engine: AgoraRtcEngineKit, didVideoMuted muted:Bool, byUid:UInt) {
        isRemoteVideoRender = !muted
    }
    
//    func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int) {
//        let videoCanvas = AgoraRtcVideoCanvas()
//        videoCanvas.uid = uid
//        videoCanvas.renderMode = .hidden
//        videoCanvas.view = remoteContainer ///->
//        agoraKit?.setupRemoteVideo(videoCanvas)
//        }
}




//protocol VideoChatVCDelegate: NSObjectProtocol {
//    func videoChat(_ vc: VideoCallViewController, didEndChatWith uid: UInt)
//    func voiceChat(_ vc: VoiceViewController, didEndChatWith uid: UInt)
//
//}
//class VideoCallViewController: UIViewController {
//
//    @IBOutlet weak var localeView: UIView!
//    @IBOutlet weak var remoteView: UIView!
//
//    @IBOutlet weak var remoteVideoMutedIndicator: UIImageView!
//    @IBOutlet weak var localVideoMutedIndicator: UIView!
//    @IBOutlet weak var micButton: UIButton!
//    @IBOutlet weak var cameraButton: UIButton!
//
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
//    let AppId: String = "bf4ccff88b0d42ad8a3f8da35ef7a17d"
//    var Token: String? = ""
//
//    weak var delegate: VideoChatVCDelegate?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        initializeAgoraEngine()
//        setupLocalVideo()
//        joinChannel()
//    }
//
//    func initializeAgoraEngine(){
//        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: AppId, delegate: self)
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
//        agoraKit?.joinChannel(byToken: Token, channelId: channel!, info: nil, uid: 0, joinSuccess:
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
//
//    @IBAction func didClickHangUpButton(_ sender: UIButton) {
//        leaveChannel()
//    }
//
//    @IBAction func didClickMuteButton(_ sender: UIButton) {
//        sender.isSelected.toggle()
//        // mute local audio
//        agoraKit?.muteLocalAudioStream(sender.isSelected)
//    }
//
//    @IBAction func didClickSwitchCameraButton(_ sender: UIButton) {
//        sender.isSelected.toggle()
//        agoraKit?.switchCamera()
//    }
//
//}
//
//
//
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
