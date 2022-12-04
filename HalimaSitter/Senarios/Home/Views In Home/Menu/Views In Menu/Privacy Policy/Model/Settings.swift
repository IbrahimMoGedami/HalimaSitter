//
//  Settings.swift
//  Halima
//
//  Created by Moustafa on 7/16/21.
//

import Foundation

// MARK: - Settings
struct Settings: Codable {
    let status: Int?
    let message: String?
    let data: SettingsData?
}

// MARK: - SettingsData
struct SettingsData: Codable {
    let id: Int?
    let email, phone: String?
    let apple, android, facebook, twitter: String?
    let instagram: String?
    let whatsapp, address, policy, about: String?
}
