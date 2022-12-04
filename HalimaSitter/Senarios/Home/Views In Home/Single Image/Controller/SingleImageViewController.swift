//
//  SingleImageViewController.swift
//  Halima
//
//  Created by Moustafa on 7/27/21.
//

import UIKit

class SingleImageViewController: UIViewController {

    @IBOutlet weak var singleImage: UIImageView!
    @IBOutlet weak var bigView: UIView!
    var image : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tabToClosePopup))
        bigView.addGestureRecognizer(tapGesture)
        if let image = image  {
            singleImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "NoImage"))

        }
        // Do any additional setup after loading the view.
    }
    
    @objc func tabToClosePopup()  {
        dismiss(animated: true, completion: nil)
    }


}
