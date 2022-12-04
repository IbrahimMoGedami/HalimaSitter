//
//  AddRoomViewController.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import UIKit
import AssetsPickerViewController
import Photos
class AddRoomViewController: UIViewController {

    @IBOutlet weak var roomNameTf: UITextField!
    @IBOutlet weak var roomImageCoolectionView: UICollectionView!
    
    lazy var imageManager = {
        return PHCachingImageManager()
    }()
    var assets = [PHAsset](){
        didSet{
            if assets.count > 0{
                let asset = assets[0]
                imageManager.requestImage(for: asset, targetSize: CGSize(width: 40, height: 40), contentMode: .aspectFit, options: nil) { (image, info) in
                }
            }
        }
    }
    var arrayRoomImage = [UIImage]()
    var singleRoom : SingleRoom?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func addNewImageBtnPressed(_ sender: UIButton) {
        showMoreSeleted()
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        getAddRoom()
    }
}
