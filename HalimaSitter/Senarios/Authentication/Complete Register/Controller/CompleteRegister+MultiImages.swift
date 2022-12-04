//
//  CompleteRegister+MultiImages.swift
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
import AssetsPickerViewController
import Photos

extension CompleteRegisterViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate  , AssetsPickerViewControllerDelegate{
    func assetsPicker(controller: AssetsPickerViewController, selected assets: [PHAsset]) {
        self.assets = [PHAsset]()
        self.assets = assets
        for e in assets {
            let asset = e
            imageManager.requestImage(for: asset, targetSize: CGSize(width: 40, height: 40), contentMode: .aspectFit, options: nil) { (image, info) in
                if let image = image {
                    if let fileName = asset.value(forKey: "filename") as? String{
                                print(fileName)
                        var newAttach = Attach(type: 1, text: fileName, data: nil, image: image)
                        self.attach.append(newAttach)
                    }
                    print(self.attach)
//                    self.tableViewHeight.constant = CGFloat((self.attach.count * 50 ))
//                    self.scrollViewHeight.constant = CGFloat(self.tableViewHeight.constant + 850 )
                    self.attachCertificatesTableView.reloadData()
                }
            }
        }
    }
    
    func assetsPickerCannotAccessPhotoLibrary(controller: AssetsPickerViewController) {
        logw("Need permission to access photo library.")
    }
    
    func assetsPickerDidCancel(controller: AssetsPickerViewController) {
        logi("Cancelled.")
    }
    
    func assetsPicker(controller: AssetsPickerViewController, shouldSelect asset: PHAsset, at indexPath: IndexPath) -> Bool {
        //logi("shouldSelect: \(indexPath.row)")
        
        // can limit selection count
        if controller.selectedAssets.count > 4 {
            logw("Cancelled.")
            return false
        }
        return true
    }
    
    func assetsPicker(controller: AssetsPickerViewController, didSelect asset: PHAsset, at indexPath: IndexPath) {
        //logi("didSelect: \(indexPath.row)")
    }
    
    func assetsPicker(controller: AssetsPickerViewController, shouldDeselect asset: PHAsset, at indexPath: IndexPath) -> Bool {
        //logi("shouldDeselect: \(indexPath.row)")
        return true
    }
    
    func assetsPicker(controller: AssetsPickerViewController, didDeselect asset: PHAsset, at indexPath: IndexPath) {
        //logi("didDeselect: \(indexPath.row)")
    }
    
    func assetsPicker(controller: AssetsPickerViewController, didDismissByCancelling byCancel: Bool) {
        logi("dismiss completed - byCancel: \(byCancel)")
    }
    
    
    
    func showMoreSeleted(){
        let picker = AssetsPickerViewController()
        picker.isShowLog = true
        picker.pickerDelegate = self
        present(picker, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
}
