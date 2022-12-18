//
//  VoiceViewController.swift
//  Halima
//
//  Created by Moustafa on 15/08/2021.
//

import UIKit
import AgoraRtcKit

class VoiceViewController: UIViewController, AgoraRtcEngineDelegate {
    
    @IBOutlet weak var controlButtonsView: UIView!
    @IBOutlet weak var switchSpekerBtn: UIButton!
    @IBOutlet weak var labelTimer: UILabel!
    
    var agoraKit: AgoraRtcEngineKit!
    var channel: String?
    var remoteUid: UInt?
//    weak var delegate: VideoChatVCDelegate?
    let AgoraAppID: String = "8520cc1eb94d4253a4b65c50a1552bb3" //"3012dd44ef194feb82db3bc57d318157"//"d7ea9747102d48608f29e5df6ad01d63" //
    var agoraToken = "006ef53d7e337684bcc9a7dde52dbfdb561IAA9AddM0/z4LFq+YWTR9I2OMG+ulUlYRL3SV/oLUf6R6kn6SbEAAAAAIgCknywCIG06XwQAAQAgbTpfAgAgbTpfAwAgbTpfBAAgbTpf"
    var AgoraChanelName: String = "testAgorw"
    
    var timer: Timer?
    var totalTime = 20
    var countTime = 0
    
    
//    init(token: String, channelName: String) {
//        super.init(nibName: nil, bundle: nil)
//        self.agoraToken = token
//        self.AgoraChanelName = channelName
////        self.totalTime = time
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeAgoraEngine()
        joinChannel()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startOtpTimer()
        totalTime = totalTime - countTime
//        NotificationCenter.default.post(name: .HideTabBar, object: nil)
//        navigationController?.isNavigationBarHidden = true
    }
    
    func initializeAgoraEngine() {
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: AgoraAppID, delegate: self)
    }

    func joinChannel() {
        agoraKit.joinChannel(byToken: agoraToken, channelId: AgoraChanelName, info:nil, uid:0) {[unowned self] (sid, uid, elapsed) -> Void in
            self.agoraKit.setEnableSpeakerphone(true)
            print("\(agoraToken)\n\(AgoraChanelName)")
            UIApplication.shared.isIdleTimerDisabled = true
        }
    }
    
    @IBAction func didClickHangUpButton(_ sender: UIButton) {
//        finishOrder(orderId: self.orderId)
        leaveChannel()
    }
    
    func leaveChannel() {
        agoraKit.leaveChannel(nil)
        hideControlButtons()
        dismiss(animated: true)
        UIApplication.shared.isIdleTimerDisabled = false
        navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func didClickHangUpButton(_ sender: UIButton) {
//        leaveChannel()
//    }
    
    func hideControlButtons() {
        controlButtonsView.isHidden = true
    }
    
    
//    func leaveChannel() {
//        if let remoteUid = remoteUid {
//            agoraKit.leaveChannel(nil)
//            hideControlButtons()
//            UIApplication.shared.isIdleTimerDisabled = false
////            delegate?.voiceChat(self, didEndChatWith: remoteUid)
//        }
//
//
//        agoraKit.leaveChannel(nil)
//        hideControlButtons()
//
//        UIApplication.shared.isIdleTimerDisabled = false
//    }

        
    @IBAction func didClickMuteButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        agoraKit.muteLocalAudioStream(sender.isSelected)
    }
    
    @IBAction func didClickSwitchSpeakerButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        agoraKit.setEnableSpeakerphone(sender.isSelected)
    }
    
}

extension VoiceViewController {
    
    private func startOtpTimer() {
//        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        print(self.totalTime)
        self.labelTimer.text = self.timeFormatted(self.totalTime)
        if totalTime != 0 {
            totalTime -= 1
        }else{
            if let timer = self.timer {
                leaveChannel()
                timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
