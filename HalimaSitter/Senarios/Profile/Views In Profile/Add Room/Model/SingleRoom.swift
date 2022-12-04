//
//  Rooms.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import Foundation

// MARK: - SingleRoom
struct SingleRoom: Codable {
    let status: Int?
    let message: String?
    let data: RoomData?
}

// MARK: - DataClass
struct RoomData: Codable {
    let id: Int?
    let name: String?
    let images: [Image]?
}

// MARK: - Image
struct Image: Codable {
    let id: Int?
    let image: String?
}
