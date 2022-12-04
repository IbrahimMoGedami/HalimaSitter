//
//  MyNotification.swift
//  Halima
//
//  Created by Moustafa on 7/18/21.
//

import Foundation

// MARK: - MyNotification
struct MyNotification: Codable {
    let status: Int?
    let message: String?
    let data: [NotificationData]?
}


// MARK: - Datum
struct NotificationData: Codable {
    let id: Int?
    let title: String?
    let redirectID: Int?
    let date, time, desc: String?
    let order : SingleOrder?

    enum CodingKeys: String, CodingKey {
        case id, title
        case redirectID = "redirect_id"
        case date, time, desc , order
    }
}
