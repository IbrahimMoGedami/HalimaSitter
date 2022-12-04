//
//  CompleteRegister+Pdf.swift
//  HalimaSitter
//
//  Created by Moustafa on 03/08/2021.
//
import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
extension CompleteRegisterViewController: UIDocumentPickerDelegate , UIDocumentMenuDelegate {
    func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard urls.count != 0 else { return }
        for myUrl in urls {
            let extention = myUrl.pathExtension
            guard let data = try? Data(contentsOf: myUrl) else { return }
            let fileName = myUrl.lastPathComponent
            print(fileName)
            if let flag = self.flag {
                switch flag {
                case 1:
                    leaseImage = data
                    leaseTf.text = fileName
                case 2:
                    residencyImage = data
                    residencyTf.text = fileName
                case 3:
                    profileImage = data
                    profileImageTf.text = fileName
                case 4:
                    taxNumberImage = data
                    taxNumberTf.text = fileName
                case 5:
                    commercialRegisterImage = data
                    commercialRegisterTf.text = fileName
                case 6:
                    var newAttach = Attach(type: 2, text: fileName, data: data, image: nil)
                    self.attach.append(newAttach)
                    print(attach)
//                    self.tableViewHeight.constant = CGFloat((self.attach.count * 50 ))
//                    self.scrollViewHeight.constant = CGFloat(self.tableViewHeight.constant + 850 )
                default:
                    print("xxx")
                }
            }
          
            self.attachCertificatesTableView.reloadData()
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    func openFiles()  {
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.text", "com.apple.iwork.pages.pages", "public.data"] , in: .import)
        documentPicker.delegate = self
        self.present(documentPicker, animated: true, completion: nil)
    }
}
