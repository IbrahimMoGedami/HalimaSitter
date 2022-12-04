//
//  Rooms.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import Foundation

// MARK: - Rooms
struct Rooms: Codable {
    let status: Int?
    let message: String?
    var data: [RoomData]?
}
