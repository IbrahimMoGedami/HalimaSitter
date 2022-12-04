//
//  ChangeStats.swift
//  HalimaSitter
//
//  Created by Moustafa on 10/08/2021.
//

import Foundation

// MARK: - ChangeStats
struct ChangeStats: Codable {
    let status: Int?
    let message: String?
    let data: SingleOrder?
}

