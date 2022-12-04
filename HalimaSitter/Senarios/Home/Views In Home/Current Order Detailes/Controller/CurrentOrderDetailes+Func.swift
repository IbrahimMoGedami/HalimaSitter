//
//  CurrentOrderDetailes+Func.swift
//  HalimaSitter
//
//  Created by Moustafa on 09/08/2021.
//

import UIKit
import GoogleMaps
import GooglePlaces
extension CurrentOrderDetailesViewController   {
    
    
    func getData()  {
        
        if let singleOrder = singleOrder {
            if let image = singleOrder.parent?.image {
                parentImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "NoImage"))
            }
            
            if let name = singleOrder.parent?.username {
                parentNameLbl.text = name
            }
            
            if let address = singleOrder.address {
                parentAddressLbl.text = address
            }
            
            if let rate = singleOrder.parent?.rate {
                parentRateView.rating = Double(rate)
            }
            
            if let rateCount = singleOrder.parent?.countRate {
                parentRateCount.text = "\(rateCount) \("Home3".localized)"
            }
            
            
            if let nationality = singleOrder.parent?.nationality {
                parentNationalityLbl.text = nationality
            }
            
        }
        if let lat = singleOrder?.lat , let long = singleOrder?.lng{
            print(lat)
            print(long)
            let camera = GMSCameraPosition.camera(withLatitude: Double(lat) ?? 0.0, longitude: Double(long) ?? 0.0, zoom: 15.0)
            orderAddressMap.camera = camera
            orderAddressMap.clear()
            addMarker(loccation: orderAddressMap.camera.target)
            
        }
        
        if let count = singleOrder?.child?.count {
            orderChildHeight.constant = CGFloat(100 * count)
            heightScrollView.constant = CGFloat((100 * count) + 500)
        }
        
        reloadData() 
        
        
        
        
    }
    
    func reloadData()  {
        if let stats = singleOrder?.status {
            switch stats {
            case 1:
                accpetedOrResfulView.isHidden = false
                startView.isHidden = true
                endView.isHidden = true
            case 2:
                accpetedOrResfulView.isHidden = true
                startView.isHidden = false
                endView.isHidden = true
            case 3:
                accpetedOrResfulView.isHidden = true
                startView.isHidden = true
                endView.isHidden = true
            case 4:
                accpetedOrResfulView.isHidden = true
                startView.isHidden = true
                endView.isHidden = true
            case 5:
                accpetedOrResfulView.isHidden = true
                startView.isHidden = true
                endView.isHidden = false
            case 6:
                accpetedOrResfulView.isHidden = true
                startView.isHidden = true
                endView.isHidden = true
            case 7:
                accpetedOrResfulView.isHidden = true
                startView.isHidden = true
                endView.isHidden = true
            default:
                print("xx")
            }
        }
    }
    
    
    func addMarker(loccation :CLLocationCoordinate2D) {
        let marker = GMSMarker()
        marker.position = loccation
        marker.title = "Halima"
        marker.snippet = "Location"
        marker.map = orderAddressMap
    }
    
    func goToRatesAndCommentsView()  {
        let vc = AppStoryboard.RatesAndComments.viewController(viewControllerClass: RatesAndCommentsViewController.self)
        vc.modalPresentationStyle = .fullScreen
        if let parents = singleOrder?.parent {
            vc.parents = parents
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func getCall(){
        
        if let phone = singleOrder?.parent?.phone {
            if let phoneCallURL = URL(string: "tel://\(phone)") {
                let application:UIApplication = UIApplication.shared
                if application.canOpenURL(phoneCallURL) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                }}
        }
    }
    
    func goToSingleImageView()  {
        let vc = AppStoryboard.SingleImage.viewController(viewControllerClass: SingleImageViewController.self)
        vc.modalPresentationStyle = .overFullScreen
        if let singleOrder = singleOrder {
            if let image = singleOrder.parent?.image {
                vc.image = image
                present(vc, animated: true, completion: nil)
            }
        }
    }
    
}
