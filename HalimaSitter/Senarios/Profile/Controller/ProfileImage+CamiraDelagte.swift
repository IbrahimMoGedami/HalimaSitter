//
//  ProfileImage+CamiraDelagte.swift
//  Halima
//
//  Created by Moustafa on 7/15/21.
//

import Foundation
import NVActivityIndicatorView
import MOLH
import Lottie
import SDWebImage
import Alamofire
import Photos

extension ProfileViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            profileImage.image = image
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

