import UIKit
import GooglePlaces
import GoogleMaps
import IQKeyboardManagerSwift
import MOLH
import Firebase
import Messages
import AVFoundation
import UserNotifications
import FirebaseMessaging
// 2TTF7TCYNS
//AAAA3w29cNk:APA91bHWl6BiXTOxuVJzYpR70AxQKy6Igaim3bT38IORfbhI49uFsvph6rGwVbG40IG1vPFG_EHlwvILvmCbULM8EAXWkUoDdLjwiQHksiiVMO6As2uti32tqU5IFo76flmdztyyvQf5
// KeyID: UYH7FX4JA6

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , MOLHResetable{
    
    
    var window: UIWindow?
    
    func reset() {
        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        let stry = UIStoryboard(name: "Tab", bundle: nil)
        rootviewcontroller.rootViewController = stry.instantiateViewController(withIdentifier: "NurseryTabBarViewController")//"ParentTabBarViewController")
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        try? AVAudioSession.sharedInstance().setMode(.videoChat)
        try? AVAudioSession.sharedInstance().setCategory(.playAndRecord,
                                                         options: [.allowBluetooth, .allowBluetoothA2DP])
        GMSServices.provideAPIKey("AIzaSyCgZIwl1DqxdJbv7aec2Vnf0GkP5p4QWpo")
        GMSPlacesClient.provideAPIKey("AIzaSyCgZIwl1DqxdJbv7aec2Vnf0GkP5p4QWpo")
        IQKeyboardManager.shared.enable = true
        MOLH.shared.activate(true)
        setupNotification(application: application)
        DispatchQueue.main.async {
            if  UserDefault.getUserData()?.token != nil {
//                if UserDefault.getUserType() == 1 {
                    let storBoared = UIStoryboard(name: "Tab", bundle: nil)
                    let vc = storBoared.instantiateViewController(withIdentifier: "NurseryTabBarViewController") as! NurseryTabBarViewController //NurseryTabBarViewController
                    self.window?.rootViewController = vc
                    //                    }else {
                    //
//                }
            }else{
                let storBoared = UIStoryboard(name: "Login", bundle: nil)
                let vc = storBoared.instantiateViewController(withIdentifier: "Login")
                self.window?.rootViewController = vc
            }
        }
        
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}



extension AppDelegate: UNUserNotificationCenterDelegate, MessagingDelegate {
    
    func setupNotification(application: UIApplication) {
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        UIApplication.shared.applicationIconBadgeNumber = 0
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { (_, _) in
            DispatchQueue.main.async {
                application.registerForRemoteNotifications()
            }
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        completionHandler(.newData)
    }
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
        let userInfo = notification.request.content.userInfo
        print(userInfo)
        if let messageID = userInfo["gcm.message_id"] {
            print("Message ID: \(messageID)")
            // handle notification  message
            
            
            let dict = userInfo[AnyHashable("aps")] as! [String : Any]
            let key = userInfo[AnyHashable("key")] as? String
            let key_id = userInfo[AnyHashable("key_id")] as? String
            guard let tab = window?.rootViewController as? UITabBarController else{return}
            let channelName = userInfo[AnyHashable("channel_name")] as? String
            let token = userInfo[AnyHashable("token")] as? String
            guard let nav = tab.selectedViewController as? UINavigationController else{return}
            guard let vc = nav.viewControllers.last else {return}
            let callType = userInfo[AnyHashable("call_type")] as? String
            if callType == "voice"{
                let vc = AppStoryboard.Voice.viewController(viewControllerClass: VoiceViewController.self)
                vc.AgoraChanelName = channelName ?? ""
                vc.agoraToken = token ?? ""
                nav.pushViewController(vc, animated: true)
            }else if callType == "video"{
                let vc = AppStoryboard.Video.viewController(viewControllerClass: VideoCallViewController.self)
                vc.AgoraChanelName = channelName ?? ""
                vc.AgoraToken = token
                nav.pushViewController(vc, animated: true)
            }else{
                print("ooooooo")
            }
            
            
            let _ = "\(userInfo[AnyHashable("body")] as? String ?? "")"
            let _ = "\(userInfo[AnyHashable("title")] as? String ?? "")"
            
            print(key ?? "")
        }
        
        // Change this to your preferred presentation option
        completionHandler([.sound , .alert , .badge])
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        if let fcmToken = fcmToken {
            print("fcmToken: ", fcmToken)
            
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let application = UIApplication.shared
        let userInfo = response.notification.request.content.userInfo
        let dict = userInfo[AnyHashable("aps")] as! [String : Any]
        let channelName = userInfo[AnyHashable("channel_name")] as? String
        let token = userInfo[AnyHashable("token")] as? String
        let callType = userInfo[AnyHashable("call_type")] as? String
        guard let tab = window?.rootViewController as? UITabBarController else{return}
        guard let nav = tab.selectedViewController as? UINavigationController else{return}
//        let vc = nav.viewControllers.last
        print(userInfo)
        if callType == "voice"{
            let vc = AppStoryboard.Voice.viewController(viewControllerClass: VoiceViewController.self)
            vc.AgoraChanelName = channelName ?? ""
            vc.agoraToken = token ?? ""
            print("\(channelName)\n\(token)")
            nav.pushViewController(vc, animated: true)
        }else if callType == "video"{
            let vc = AppStoryboard.Video.viewController(viewControllerClass: VideoCallViewController.self)
            vc.AgoraChanelName = channelName ?? ""
            vc.AgoraToken = token
            print("\(channelName)\n\(token)")
            nav.pushViewController(vc, animated: true)
        }else{
            print("oooooo")
        }
        
        if(application.applicationState == .inactive)
        {
            
        }else if application.applicationState == .background {
            
            
        }
        
        completionHandler()
    }
    
    func application(
      _ application: UIApplication,
      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
      Messaging.messaging().apnsToken = deviceToken
    }
    
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        print("didReceiveRemoteNotification")

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotificationsVC")  as! UINavigationController
        
        self.window?.rootViewController?.tabBarController?.tabBar.isHidden = false
        self.window?.rootViewController?.present(vc, animated: true, completion: nil)
    }
    
    
}
