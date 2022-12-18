//
//  ParentTabBarViewController.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import UIKit

class NurseryTabBarViewController: UITabBarController  , UITabBarControllerDelegate{
    
    var tabBarChoose : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        presentToTabView()
        self.delegate = self

        updateDesign()
        if let tabBarChoose = tabBarChoose {
            self.selectedIndex = tabBarChoose
        }
    }
    
    
    func presentToTabView()  {
        self.tabBar.tintColor = UIColor(named: "MainColor")
        let parentHomeViewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "Nav1")
        let notificationViewController = UIStoryboard(name: "Notification", bundle: nil).instantiateViewController(withIdentifier: "Nav2")
        let messagesViewController = UIStoryboard(name: "Messages", bundle: nil).instantiateViewController(withIdentifier: "Nav3")
        let profileViewController = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "Nav4")
        
        parentHomeViewController.tabBarItem = UITabBarItem(title: "tab1".localized, image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        notificationViewController.tabBarItem = UITabBarItem(title: "tab2".localized, image: UIImage(named: "notification"), selectedImage: UIImage(named: "notification"))
        messagesViewController.tabBarItem = UITabBarItem(title: "tab3".localized, image: UIImage(named: "message"), selectedImage: UIImage(named: "message"))
        profileViewController.tabBarItem = UITabBarItem(title: "tab4".localized, image: UIImage(named: "person"), selectedImage: UIImage(named: "person"))
        viewControllers = [parentHomeViewController, notificationViewController  , messagesViewController , profileViewController ]
        
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
//        switch tabBarController.selectedIndex {
//        case 1:
//            if UserDefault.getcheckLogin() == false {
//                goToLogin()
//            }
//        case 2:
//            if UserDefault.getcheckLogin() == false {
//                goToLogin()
//            }
//
//        default:
//            break
//        }
    }
    
    func goToLogin()  {
        if  let vc = storyboard?.instantiateViewController(withIdentifier: "Login")  {
        vc.modalPresentationStyle = .fullScreen
          present(vc, animated: true, completion: nil)
        }
    }
    
    
    func updateDesign()  {
        
        
        
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
                tabBar.layer.shadowOpacity = 0.5
                tabBar.layer.shadowOffset = CGSize.zero
                tabBar.layer.shadowRadius = 5
                self.tabBar.layer.borderColor = UIColor.clear.cgColor
                self.tabBar.layer.borderWidth = 0
                self.tabBar.clipsToBounds = false
                self.tabBar.backgroundColor = UIColor.white
                UITabBar.appearance().shadowImage = UIImage()
                UITabBar.appearance().backgroundImage = UIImage()
        
        
                self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//       // UITabBar.appearance().barTintColor = UIColor.white // your color
//        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
//        tabBar.layer.shadowColor = UIColor.black.cgColor
//        tabBar.layer.shadowOpacity = 0.3
//        UITabBar.appearance().barTintColor = UIColor.white // your color
//
////        let Tcontroller = self.window.rootViewController as? UITabBarController
////        Tcontroller?.tabBar.barTintColor = UIColor.black
//      //  self.tabBar.barTintColor = UIColor.white
//        self.tabBar.layer.shadowColor = UIColor.gray.cgColor
//        self.tabBar.layer.shadowOffset = CGSize()
//        self.tabBar.layer.shadowOpacity = 0.5
        self.delegate = self
    }
    
}

