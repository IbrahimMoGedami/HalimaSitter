//
//  AttachImage.swift
//  HalimaSitter
//
//  Created by Moustafa on 03/08/2021.
//

import UIKit
struct AttachImageImageFiles {
    var Attachs : [Attach]
}


struct Attach {
    var type : Int?
    var text : String?
    var data : Data?
    var image : UIImage?
}
