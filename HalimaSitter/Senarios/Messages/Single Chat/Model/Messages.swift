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

struct  GetAgoraTokenModel: Codable{
    var message: String?
    var status: Int?
    var data: GetAgoraTokenData?
}

struct GetAgoraTokenData: Codable{
    var token: String?
    var channelName: String?
    var callType: AgoraType?
    
    enum CodingKeys: String, CodingKey {
        case token, channelName
        case callType = "call_type"
    }
}
