//
//  CompleteRegisterViewController.swift
//  HalimaSitter
//
//  Created by Moustafa on 02/08/2021.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
import AssetsPickerViewController
import Photos
class CompleteRegisterViewController: UIViewController  {
    @IBOutlet weak var commicalRegisterView: UIView!
    @IBOutlet weak var taxView: UIView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var commercialRegisterTf: DesignableUITextField!
    @IBOutlet weak var taxNumberTf: DesignableUITextField!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profileImageTf: DesignableUITextField!
    @IBOutlet weak var leaseTf: DesignableUITextField!
    @IBOutlet weak var residencyTf: DesignableUITextField!
    @IBOutlet weak var attachCertificatesTableView: ContentSizedTableView!{
        didSet{
            attachCertificatesTableView.rowHeight = 50
        }
    }
    
    @IBOutlet weak var taxCerLabel: UILabel!
    @IBOutlet weak var taxCerTableView: UITableView!
    @IBOutlet weak var licenseTf: DesignableUITextField!
    @IBOutlet weak var licenseView: UIView!
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
    var certificatesImages = [UIImage]()
    var certificatesPdf = [Data]()
    var  attach = [Attach]()
    var userType : Int?
    var leaseImage : Any?
    var residencyImage : Any?
    var profileImage : Any?
    var taxNumberImage : Any?
    var commercialRegisterImage : Any?
    var flag : Int?
    var register : Register?
    var licenseTypes: [String] = ["Known".localized, "Free work".localized, "Home nursery license".localized]
    var selectedLicenseIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDesign()
    }
    
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        getCompleteRegisterData()
    }
    @IBAction func attachImagesBtnPressed(_ sender: UIButton) {
        flag = sender.tag
        if flag == 3 {
            show()
        }else{
        showAlert()
        }
    }
    
    @IBAction func certificatesBtnPressed(_ sender: UIButton) {
        flag = 6
        showAlert()
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func licenseBtnPressed(_ sender: Any) {
        showLicenceTypes()
    }
    
}


