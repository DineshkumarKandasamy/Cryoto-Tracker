//
//  Model.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 19.04.22.
//

import Foundation


// MARK: - Market
struct Market: Codable {
    let price: Double
    let exchange, pair: String
    let pairPrice, volume: Double
    let link: String?
}
