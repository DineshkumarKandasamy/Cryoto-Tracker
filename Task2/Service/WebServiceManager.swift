//
//  WebServiceManager.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 22.04.22.
//

//import Foundation

private enum EndPoint: String {
    case coins = "/coins"
    case markets = "/markets"
    case exchanges = "/exchanges"
    case news = "/news"
    case currencies = "/fiats"
}

enum BaseURL: String {
    case url = "https://api.coinstats.app/public/v1"
}

enum Request {
    case coins
    case markets
    case exchanges
    case news
    case currencies

    var path: String {
        switch self {
        case .coins:
            return "\(EndPoint.coins.rawValue)"
        case .markets:
            return EndPoint.markets.rawValue
        case .exchanges:
            return EndPoint.exchanges.rawValue
        case .news:
            return EndPoint.news.rawValue
        case .currencies:
            return EndPoint.currencies.rawValue
        }
    }
}
