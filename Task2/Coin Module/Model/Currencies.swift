//
//  Currencies.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 18.04.22.
//

import Foundation

// MARK: - Coins
struct Coins: Codable {
    let coins: [Coin]
}

// MARK: - Coin
struct Coin: Codable {
    let id: String
    let icon: String
    let name, symbol: String
    let rank: Int
    let price, priceBtc, volume, marketCap: Double
    let availableSupply, totalSupply, priceChange1H, priceChange1D: Double
    let priceChange1W: Double
    let websiteURL: String
    let twitterURL: String?
    let exp: [String]
    let contractAddress: String?
    let decimals: Int?
    let redditURL: String?

    enum CodingKeys: String, CodingKey {
        case id, icon, name, symbol, rank, price, priceBtc, volume, marketCap, availableSupply, totalSupply
        case priceChange1H = "priceChange1h"
        case priceChange1D = "priceChange1d"
        case priceChange1W = "priceChange1w"
        case websiteURL = "websiteUrl"
        case twitterURL = "twitterUrl"
        case exp, contractAddress, decimals
        case redditURL = "redditUrl"
    }
}
