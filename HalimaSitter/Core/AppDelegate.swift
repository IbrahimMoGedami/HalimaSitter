import UIKit
import GooglePlaces
import GoogleMaps
import IQKeyboardManagerSwift
import MOLH
import Firebase
import Messages
import AVFoundation

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
       FirebaseApp.configure()
        
        DispatchQueue.main.async {
                if  UserDefault.getcheckLogin() == true {
                    if UserDefault.getUserType() == 1 {
                    let storBoared = UIStoryboard(name: "Tab", bundle: nil)
                    let vc = storBoared.instantiateViewController(withIdentifier: "NurseryTabBarViewController") as! NurseryTabBarViewController //NurseryTabBarViewController
                    self.window?.makeKeyAndVisible()
                    self.window?.rootViewController = vc
                    }else {

                    }
                }else{
                    let storBoared = UIStoryboard(name: "Login", bundle: nil)
                    let vc = storBoared.instantiateViewController(withIdentifier: "Login")
                    self.window?.makeKeyAndVisible()
                    self.window?.rootViewController = vc
                }
        }

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

