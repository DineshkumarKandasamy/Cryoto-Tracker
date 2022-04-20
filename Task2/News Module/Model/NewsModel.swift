//
//  News.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 19.04.22.
//

import Foundation

// MARK: - News
struct NewsList: Codable {
    let news: [News]
}

// MARK: - NewsElement
struct News: Codable {
    let id: String
    let feedDate: Int
    let source, title: String
    let icon: String
    let imgURL: String
    let newsDescription: String
    let link: String
    let sourceLink: String
    let reactionsCount: [String: Int]
    let shareURL: String
    let relatedCoins: [String]
    let content: Bool
    let coins: [Coinn]

    enum CodingKeys: String, CodingKey {
        case id, feedDate, source, title, icon, imgURL
        case newsDescription = "description"
        case link, sourceLink, reactionsCount, shareURL, relatedCoins, content, coins
    }
}

// MARK: - Coin
struct Coinn: Codable {
    let coinKeyWords: String
    let coinPercent: Double
    let coinTitleKeyWords, coinNameKeyWords, coinIDKeyWords: String

    enum CodingKeys: String, CodingKey {
        case coinKeyWords, coinPercent, coinTitleKeyWords, coinNameKeyWords
        case coinIDKeyWords = "coinIdKeyWords"
    }
}
