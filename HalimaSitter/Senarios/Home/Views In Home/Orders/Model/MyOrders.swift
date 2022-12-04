//
//  MyOrders.swift
//  Halima
//
//  Created by Moustafa on 7/16/21.
//

import Foundation

// MARK: - MyOrders
struct MyOrders: Codable {
    let status: Int?
    let message: String?
    let data: MyOrdersData?
}


// MARK: - MyOrdersData
struct MyOrdersData: Codable {
    let reservations: [SingleOrder]?
    let ordersLast, ordersCurrent: [SingleOrder]?

    enum CodingKeys: String, CodingKey {
        case reservations = "Reservations"
        case ordersLast, ordersCurrent
    }
}


// MARK: - SingleOrder
struct SingleOrder: Codable {
    let id, key, type, status: Int?
    let startTime, endTime, distance , time , laterDate,  createdAt: String?
    let lat, lng, totalPrice , address: String?
    let hoursNumber : Int?
    let child: [Child]?
    let sitter: UserData?
    let monitor: Parent?
    let parent: Parent?

    enum CodingKeys: String, CodingKey {
        case id, key, type, status
        case startTime = "start_time"
        case endTime = "end_time"
        case distance, time
        case laterDate = "later_date"
        case createdAt = "created_at"
        case lat, lng, hoursNumber
        case totalPrice = "total_price"
        case address, child, sitter, monitor, parent
    }
}


// MARK: - parent
struct Parent: Codable {
    let id, key: Int?
    let phone, email: String?
    let countRate, activeCode, passwordCode, hasOrder: Int?
    let username: String?
    let dateOfBirth: String?
    let nationality: String?
    let status, rate, type, gender: Int?
    let image: String?
    let country: CountrtData?
    let monitorData: MonitorData?
    let token: String?
    
    enum CodingKeys: String, CodingKey {
        case id, key, phone, email, countRate
        case activeCode = "active_code"
        case passwordCode = "password_code"
        case hasOrder = "has_order"
        case username
        case dateOfBirth = "date_of_birth"
        case nationality, status, rate, type, gender, image, country, monitorData, token
    }
}


// MARK: - MonitorData
struct MonitorData: Codable {
    let parentID, hasOrderNow: Int?
    let parentImage: String?
    let currentOrderID: Int?
    let parentLat, parentLng: String?
    let sitter: UserData?
    
    enum CodingKeys: String, CodingKey {
        case parentID = "parent_id"
        case hasOrderNow
        case parentImage = "parent_image"
        case currentOrderID = "currentOrder_id"
        case parentLat = "parent_lat"
        case parentLng = "parent_lng"
        case sitter
    }
}
// MARK: - Child
struct Child: Codable {
    let id, key: Int?
    let name, hobbies, dateOfBirth, nationality: String?
    let note: String?
    let rate, gender, haveIssue: Int?
    let image: String?
}
