//
//  UserRate.swift
//  HalimaSitter
//
//  Created by Moustafa on 10/08/2021.
//

import Foundation

// MARK: - UserRate
struct UserRate: Codable {
    let status: Int?
    let message: String?
    let data: [Rate]?
}
