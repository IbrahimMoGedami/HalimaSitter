//
//  CompleteRegister+Camira.swift
//  HalimaSitter
//
//  Created by Moustafa on 03/08/2021.
//

import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import SDWebImage
import Alamofire
import Photos

extension CompleteRegisterViewController   {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            if let imageURL = info[UIImagePickerController.InfoKey.referenceURL] as? URL {
                   let result = PHAsset.fetchAssets(withALAssetURLs: [imageURL], options: nil)
                   let asset = result.firstObject
            if let flag = self.flag {
                switch flag {
                case 1:
                    leaseImage = image
                    if let fileName = asset?.value(forKey: "filename") as? String{
                        leaseTf.text = fileName
                    }
                case 2:
                    residencyImage = image
                    if let fileName = asset?.value(forKey: "filename") as? String{
                        residencyTf.text = fileName
                    }
                case 3:
                    profileImage = image
                    if let fileName = asset?.value(forKey: "filename") as? String{
                        profileImageTf.text = fileName
                    }
                case 4:
                    taxNumberImage = image
                    if let fileName = asset?.value(forKey: "filename") as? String{
                        taxNumberTf.text = fileName
                    }
                case 5:
                    commercialRegisterImage = image
                    if let fileName = asset?.value(forKey: "filename") as? String{
                        commercialRegisterTf.text = fileName
                    }
                default:
                    print("xxx")
                }
            }
            }
           
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func show(){
        let image = UIImagePickerController()
        image.delegate = self
        let actionsheet = UIAlertController(title: "imagePicker1".localized, message: "imagePicker2".localized, preferredStyle: .actionSheet)
        actionsheet.addAction(UIAlertAction(title: "imagePicker3".localized, style: .default, handler: { (action:UIAlertAction)in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                image.sourceType = .camera
                self.present(image, animated: true, completion: nil)
            }else
            {
                print("Camera is Not Available")
            }
        }))
        actionsheet.addAction(UIAlertAction(title: "imagePicker4".localized, style: .default, handler: { (action:UIAlertAction)in
            image.sourceType = .photoLibrary
            self.present(image, animated: true, completion: nil)
        }))
        actionsheet.addAction(UIAlertAction(title: "imagePicker5".localized, style: .cancel, handler: nil))
        self.present(actionsheet,animated: true, completion: nil)
    }
    
    
    
    
}

