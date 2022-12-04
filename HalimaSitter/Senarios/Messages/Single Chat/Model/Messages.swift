//
//  Messages.swift
//  Halima
//
//  Created by Moustafa on 7/17/21.
//

import UIKit
struct ChatMessages {
    var msg : [Messages]
}


struct Messages {
    var userId : Int?
    var message : String?
    var messageTime : String?
    var senderId : Int?
    var sitterId : Int?
}
