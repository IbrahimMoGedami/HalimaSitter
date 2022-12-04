//
//  BabySiters.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

// MARK: - BabySiters
struct BabySiters: Codable {
    let status: Int?
    let message: String?
    var data: [BabySiterData]?
}


// MARK: - BabySiterData
struct BabySiterData: Codable {
    let id: Int?
    let name, degree, about, birthday: String?
    let image: String?
}
