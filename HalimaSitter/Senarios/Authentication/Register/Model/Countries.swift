//
//  Countries.swift
//  Halima
//
//  Created by Moustafa on 7/5/21.
//

import Foundation

// MARK: - Countries
struct Countries: Codable {
    let status: Int?
    let message: String?
    let data: [CountrtData]?
}



// MARK: - CountrtData
struct CountrtData: Codable {
    let id: Int?
    let name, phoneKey: String?
    let phoneNum: Int?
    let icon: String?
}


// MARK: - Licences
struct Licences: Codable {
    let status: Int?
    let message: String?
    let data: [LicencesData]?
}



// MARK: - CountrtData
struct LicencesData: Codable {
    let id: String?
    let name: String?
}
