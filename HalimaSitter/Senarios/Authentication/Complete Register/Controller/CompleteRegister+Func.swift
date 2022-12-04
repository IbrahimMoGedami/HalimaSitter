//
//  CompleteRegister+Func.swift
//  HalimaSitter
//
//  Created by Moustafa on 03/08/2021.
//

import UIKit
import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import ImageSlideshow

extension CompleteRegisterViewController    {
    
    func showAlert() {
        let alert = UIAlertController(title: "AddCertificates".localized, message: "Select".localized, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Images".localized, style: .default , handler:{ (UIAlertAction)in
            if let flag = self.flag {
                switch flag {
                case 1:
                    self.show()
                case 2:
                    self.show()
                case 3:
                    self.show()
                case 4:
                    self.show()
                case 5:
                    self.show()
                case 6:
                    self.showMoreSeleted()
                default:
                    print("xxx")
                }
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Files".localized, style: .default , handler:{ (UIAlertAction)in
            self.openFiles()
        }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel, handler:{ (UIAlertAction)in
        }))
        self.present(alert, animated: true, completion: {
        })
    }
    
    
    func updateDesign()  {
        setUpTableView()
        //  attachCertificatesTableView.isHidden = true
        updateDesignLang()
        leaseTf.attributedPlaceholder = NSAttributedString(string: "Lease".localized,
                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        residencyTf.attributedPlaceholder = NSAttributedString(string: "ResidencePhoto".localized,
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        profileImageTf.attributedPlaceholder = NSAttributedString(string: "ProfileImage".localized,
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        taxNumberTf.attributedPlaceholder = NSAttributedString(string: "TaxNumber".localized,
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        commercialRegisterTf.attributedPlaceholder = NSAttributedString(string: "CommercialRegister".localized,
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        
        licenseTf.attributedPlaceholder = NSAttributedString(string: "License type".localized,
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "LblColor2")])
        scrollView.contentInsetAdjustmentBehavior = .never
        bodyView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner  ]
        leaseTf.clipsToBounds = true
        residencyTf.clipsToBounds = true
        profileImageTf.clipsToBounds = true
        taxNumberTf.clipsToBounds = true
        commercialRegisterTf.clipsToBounds = true
        if let userType = userType {
            if userType == 1 {
               // taxView.isHidden = true
                commicalRegisterView.isHidden = true
                licenseView.isHidden = false
            }else{
               // taxView.isHidden = false
                commicalRegisterView.isHidden = false
                licenseView.isHidden = true
            }
        }
        
    }
    
    func updateDesignLang()  {
        if MOLHLanguage.currentAppleLanguage() == "en"{
            leaseTf.textAlignment = .left
            residencyTf.textAlignment = .left
            profileImageTf.textAlignment = .left
            taxNumberTf.textAlignment = .left
            commercialRegisterTf.textAlignment = .left
        }
        else if  MOLHLanguage.currentAppleLanguage() == "ar"{
            leaseTf.textAlignment = .right
            residencyTf.textAlignment = .right
            profileImageTf.textAlignment = .right
            taxNumberTf.textAlignment = .right
            commercialRegisterTf.textAlignment = .right
            
        }
    }
    
    func goToWating()  {
        let vc = AppStoryboard.WaitToAccpeted.viewController(viewControllerClass: WatingToAccpetedViewController.self)
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Func to Empty TextFaild
    
    func clearText()  {
        leaseTf.text = ""
        residencyTf.text = ""
        profileImageTf.text = ""
        taxNumberTf.text = ""
        commercialRegisterTf.text = ""
        leaseImage = nil
        residencyImage = nil
        profileImage = nil
        taxNumberImage = nil
        commercialRegisterImage = nil
        certificatesImages = []
        certificatesPdf = []
        attach = []
//        self.tableViewHeight.constant = CGFloat((self.attach.count * 50 ))
//        self.scrollViewHeight.constant = CGFloat(self.tableViewHeight.constant + 850 )
        self.attachCertificatesTableView.reloadData()
        
    }
    func showLicenceTypes(){
        
       

//        let dropDown = DropDown()
//      //  dropDown.semanticContentAttribute = (MOLHLanguage.currentAppleLanguage() == "ar") ? .forceRightToLeft : .forceLeftToRight
//        dropDown.anchorView = licenseView
//        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
//        dropDown.direction = .bottom
//
//        dropDown.dataSource = licenseTypes
//        dropDown.show()
//        dropDown.selectionAction = { (index,item) in
//            self.selectedLicenseIndex = index
//            self.licenseTf.text = item
//        }
    }
}
