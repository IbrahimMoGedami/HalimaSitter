//
//  ParentMessages.swift
//  HalimaSitter
//
//  Created by Moustafa on 10/08/2021.
//

import Foundation

// MARK: - ParentMessages
struct ParentMessages: Codable {
    let status: Int?
    let message: String?
    let data: [Parent]?
}
