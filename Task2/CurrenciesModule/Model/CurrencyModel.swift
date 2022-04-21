//
//  CurrencyModel.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 21.04.22.
//

import Foundation

// MARK: - Currency
struct Currency: Codable {
    let name: String
    let rate: Double
    let symbol: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case name, rate, symbol
        case imageURL = "imageUrl"
    }
}
