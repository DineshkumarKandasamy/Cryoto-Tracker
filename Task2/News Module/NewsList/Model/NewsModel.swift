//
//  News.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 19.04.22.
//

import Foundation

// MARK: - News
struct News: Codable {
    let news: [NewsElement]
}

// MARK: - NewsElement
struct NewsElement: Codable {
    let id: String
    let feedDate: Int
    let source, title: String
    let isFeatured: Bool?
    let newsDescription: String
    let imgURL: String
    let link: String
    let sourceLink: String
    let reactionsCount: [String: Int]?
    let shareURL: String
    let relatedCoins: [String]?

    enum CodingKeys: String, CodingKey {
        case id, feedDate, source, title, isFeatured
        case newsDescription = "description"
        case imgURL, link, sourceLink, reactionsCount, shareURL, relatedCoins
    }
}
