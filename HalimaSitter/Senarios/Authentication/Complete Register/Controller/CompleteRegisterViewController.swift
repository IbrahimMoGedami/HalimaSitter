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
    var attach = [Attach]()
    var licencesNames = [String]()
    var licencesPicker = DataPicker()
    var userType : Int?
    var leaseImage : Any?
    var residencyImage : Any?
    var profileImage : Any?
    var taxNumberImage : Any?
    var commercialRegisterImage : Any?
    var flag: Int?
    var licenceId: String?
    var register : Register?
    var licencesData = [LicencesData]()
    
    var licenseTypes: [String] = ["Known".localized, "Free work".localized, "Home nursery license".localized]
    var selectedLicenseIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPicker()
        getLicencesData()
        updateDesign()
        taxNumberTf.delegate = self
    }
    
    func getLicenceId(index: Int) -> String{
        return licencesData[index].id ?? ""
    }
    
    func setupPicker() {
        licencesPicker.initPickerView(txtField: licenseTf, view: view)  { [weak self] index in
            guard let self = self,let index = index else {return}
//            print(licencesData)
            self.licenceId = self.licencesData[index].id
//            let id = self.presenter.getCountryID(index: index)
//            self.presenter.country(id)
        }
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


extension CompleteRegisterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == taxNumberTf {
            let maxLength = 15
            let currentString = (textField.text ?? "") as NSString
            let newString = currentString.replacingCharacters(in: range, with: string)
            return newString.count <= maxLength
        }else {
            return true
        }
        
    }
}
