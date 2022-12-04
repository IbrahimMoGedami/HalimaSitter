//
//  Register.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import Foundation

// MARK: - Register
struct Register: Codable {
    let status: Int?
    let message: String?
    let data: UserData?
}


// MARK: - UserData
struct UserData: Codable {
    let id, key: Int
    let phone, email, distance, time: String?
    let lat, lng, address: String?
    let isFav: Bool?
    let ordersCount: Int?
    let username, nurseryName: String?
    let status, type, rate: Int?
    let moneyRate, nationality, aboutSitter: String?
    let currentChildNum, gender: Int?
    let image: String?
    let roomImages: [RoomData]?
    let nurseryMembers: [BabySiterData]?
    let country: CountrtData?
    let files: [File]?
    let experienceCertificatesImage, experienceCertificatesFile: [ExperienceCertificates]?
    let rates: [Rate]?
    let rateCount: Int?
    let token: String?
    
    enum CodingKeys: String, CodingKey {
        case id, key, phone, email, distance, time, lat, lng, address
        case isFav = "is_fav"
        case ordersCount, username
        case nurseryName = "nursery_name"
        case status, type, rate, moneyRate, nationality, aboutSitter, currentChildNum, gender, image, roomImages , country
        case nurseryMembers = "NurseryMembers"
        case files, experienceCertificatesImage, experienceCertificatesFile, rates, rateCount, token
    }
}


struct ExperienceCertificates: Codable {
    let id: Int?
    let file: String?
}

// MARK: - File
struct File: Codable {
    let id: Int?
    let residency, lease, taxCard, commercialRegister: String?
    
    enum CodingKeys: String, CodingKey {
        case id, residency, lease
        case taxCard = "tax_card"
        case commercialRegister = "commercial_register"
    }
}


// MARK: - Rate
struct Rate: Codable {
    let id: Int?
    let name: String?
    let image: String?
    let rate: Int?
    let comment: String?
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, image, rate, comment
        case createdAt = "created_at"
    }
}
