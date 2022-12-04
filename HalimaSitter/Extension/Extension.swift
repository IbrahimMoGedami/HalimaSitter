//
//  Extension.swift
//  HappyTimes
//
//  Created by Mustafa on 4/7/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit

extension UITextField{
    func addInnerShadow() {
        let innerShadow = CALayer()
        innerShadow.frame = bounds
        
        // Shadow path (1pt ring around bounds)
        let radius = 5 //self.frame.size.height/2
        let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: -10, dy:-10), cornerRadius:CGFloat(radius))
        let cutout = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius:CGFloat(radius)).reversing()
        
        
        path.append(cutout)
        innerShadow.shadowPath = path.cgPath
        innerShadow.masksToBounds = true
        // Shadow properties
        innerShadow.shadowColor = UIColor.gray.cgColor
        innerShadow.shadowOffset = CGSize(width: 0, height: 5)
        innerShadow.shadowOpacity = 0.6
        innerShadow.shadowRadius = 3
        innerShadow.cornerRadius = 5//self.frame.size.height/2
        layer.addSublayer(innerShadow)
    }
}


extension UIColor {
    convenience init?(hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        let red, green, blue, alpha: CGFloat
        switch chars.count {
        case 3:
            chars = chars.flatMap { [$0, $0] }
            fallthrough
        case 6:
            chars = ["F","F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            return nil
        }
        self.init(red: red, green: green, blue:  blue, alpha: alpha)
    }
}


//MARK:- NSAttributedString

extension NSAttributedString {
    static func withDualText(text1: String ,ofSizeText1: CGFloat ,text2: String ,ofSizeText2: CGFloat , color1 : UIColor , color2 : UIColor  ) -> NSMutableAttributedString{
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: text1, attributes: [NSAttributedString.Key.foregroundColor: color1, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: ofSizeText1)]))
        text.append(NSAttributedString(string: text2, attributes: [NSAttributedString.Key.foregroundColor: color2 , NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: ofSizeText2)]))
        return text
    }
    
    static func withDua2Text(text1: String ,ofSizeText1: CGFloat ,text2: String ,ofSizeText2: CGFloat  ,text3: String , color1 : UIColor , color2 : UIColor   ) -> NSMutableAttributedString{
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: text1, attributes: [NSAttributedString.Key.foregroundColor: color1, NSAttributedString.Key.font : UIFont.systemFont(ofSize: ofSizeText1)]))
        text.append(NSAttributedString(string: text2, attributes: [NSAttributedString.Key.foregroundColor: color2 , NSAttributedString.Key.font: UIFont.systemFont(ofSize: ofSizeText1)]))
        text.append(NSAttributedString(string: text3, attributes: [NSAttributedString.Key.foregroundColor: color1 , NSAttributedString.Key.font: UIFont.systemFont(ofSize: ofSizeText1)]))
        
        return text
    }
    
    
}

import MOLH

extension UIViewController {
    func parentIQContainerViewController() -> UIViewController? {
        return self
    }
    
    
    
    
}


extension UIView {
    
    @objc func parentContainerViewController() -> UIViewController? {
        
        var matchController = viewContainingController()
        var parentContainerViewController: UIViewController?
        
        if var navController = matchController?.navigationController {
            
            while let parentNav = navController.navigationController {
                navController = parentNav
            }
            
            var parentController: UIViewController = navController
            
            while let parent = parentController.parent,
                  (parent.isKind(of: UINavigationController.self) == false &&
                    parent.isKind(of: UITabBarController.self) == false &&
                    parent.isKind(of: UISplitViewController.self) == false) {
                
                parentController = parent
            }
            
            if navController == parentController {
                parentContainerViewController = navController.topViewController
            } else {
                parentContainerViewController = parentController
            }
        } else if let tabController = matchController?.tabBarController {
            
            if let navController = tabController.selectedViewController as? UINavigationController {
                parentContainerViewController = navController.topViewController
            } else {
                parentContainerViewController = tabController.selectedViewController
            }
        } else {
            while let parentController = matchController?.parent,
                  (parentController.isKind(of: UINavigationController.self) == false &&
                    parentController.isKind(of: UITabBarController.self) == false &&
                    parentController.isKind(of: UISplitViewController.self) == false) {
                
                matchController = parentController
            }
            
            parentContainerViewController = matchController
        }
        
        let finalController = parentContainerViewController?.parentIQContainerViewController() ?? parentContainerViewController
        
        return finalController
        
    }
    
    
    @objc func viewContainingController() -> UIViewController? {
        
        var nextResponder: UIResponder? = self
        
        repeat {
            nextResponder = nextResponder?.next
            
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            
        } while nextResponder != nil
        
        return nil
    }
    
}

//MARK:- String

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughColor ,value:  UIColor.red, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
    
}


extension UIViewController {
    func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    
    func addNavigation( viewIdentifier : String  ,view: UIView)  {
        weak var currentViewController : UIViewController?
        currentViewController = self.storyboard?.instantiateViewController(withIdentifier: viewIdentifier)
        currentViewController?.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(currentViewController!)
        self.addSubview(subView: currentViewController!.view, toView: view)
    }
    
    func presentViewControllerWithTransition(viewController: UIViewController ,animated: Bool ,direction: CATransitionSubtype ){
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        transition.subtype = direction
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        navigationController?.pushViewController(viewController, animated: false)
        
        // present(viewController, animated: animated, completion: nil)
    }
    
    //    func showNavigation() {
    //        navigationItem.hidesBackButton = true
    //        let menu = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(menuBtn))
    //        menu.image = UIImage(named: "Menu")
    //        menu.tintColor = UIColor(named: "BtnColor1")
    //        self.navigationItem.leftBarButtonItems = [menu]
    //       // self.navigationItem.rightBarButtonItems = [menu]
    //
    //
    //    }
    //
    //    func showAndBacNavigation() {
    //        navigationItem.hidesBackButton = true
    //        let menu = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(menuBtn))
    //        menu.image = UIImage(named: "Menu")
    //        menu.tintColor = UIColor(named: "BtnColor1")
    //        let back = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(backDoneBtn))
    //        if MOLHLanguage.currentAppleLanguage() == "en"{
    //            back.image = UIImage(named: "MenuBackAr")
    //             }
    //             else if  MOLHLanguage.currentAppleLanguage() == "ar"{
    //                back.image = UIImage(named: "MenuBackEn")
    //             }
    //        back.tintColor = UIColor(named: "BtnColor1")
    //        self.navigationItem.leftBarButtonItems = [menu]
    //        navigationItem.rightBarButtonItem = back
    //
    //
    //    }
    //
    
    func showNavigation(number : Int) {
        navigationItem.hidesBackButton = true
        
        let cartButton = SSBadgeButton()
        cartButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        cartButton.setImage(UIImage(named: "Component 3 – 1")?.withRenderingMode(.alwaysTemplate), for: .normal)
        cartButton.badgeEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 15)
        cartButton.tintColor = UIColor.black
        cartButton.addTarget(self, action: #selector(cartBtn), for: .touchUpInside)
        cartButton.badge = String(number)
        let search = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(searchBtn))
        search.image = UIImage(named: "Mask Group 3")
        search.tintColor = UIColor.black
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: cartButton),search]
        
        
    }
    
    func showAndBacNavigation(number : Int) {
        navigationItem.hidesBackButton = true
        
        let cartButton = SSBadgeButton()
        cartButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        cartButton.setImage(UIImage(named: "Component 3 – 1")?.withRenderingMode(.alwaysTemplate), for: .normal)
        cartButton.badgeEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 15)
        cartButton.tintColor = UIColor.black
        cartButton.addTarget(self, action: #selector(cartBtn), for: .touchUpInside)
        cartButton.badge = String(number)
        let search = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(searchBtn))
        search.image = UIImage(named: "Mask Group 3")
        search.tintColor = UIColor.black
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: cartButton),search]
        let back = UIBarButtonItem(title: "", style: .done,target: self, action: #selector(backHBtn))
        if MOLHLanguage.currentAppleLanguage() == "en"{
                 back.image = UIImage(named: "BackEn")
             }
             else if  MOLHLanguage.currentAppleLanguage() == "ar"{
                 back.image = UIImage(named: "BackAr")
             }
        back.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = back
        
        
    }
    
    @objc func cartBtn(){
        
        
    }
    

    
    @objc func searchBtn(){
//        let vc = AppStoryboard.Store.viewController(viewControllerClass: SearchViewController.self)
//        vc.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func backHBtn(){
        navigationController?.popViewController(animated: true)
        
    }
    
}


import UIKit

extension UIView {
    
    func pinEdgesToSuperView() {
        guard let superView = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
    }
    
}
