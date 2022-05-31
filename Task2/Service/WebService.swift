//
//  WebService.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 18.04.22.
//

import Alamofire
import Foundation

protocol WebServiceProtocol {
    func getCoins(skip: Int, limit: Int, currency: String, complete: @escaping([Coin])->())
    func getMarkets(coinId: String, complete: @escaping([Market])->())
    func getExchanges(completion: @escaping([String])->())
    func getNews(skip: Int, limit: Int, completion: @escaping([NewsElement])->())
    func getCurrencies(completion: @escaping([Currency])->())
}

class WebService: WebServiceProtocol {
    static let shared = WebService()
    
    func getCoins(skip: Int, limit: Int, currency: String, complete: @escaping([Coin])->()) {
        let url = "\(BaseURL.url.rawValue)\(Request.coins.path)?skip=\(skip)&limit=\(limit)&currency=\(currency)"
        NetworkRequest.shared.requestAPI(type: Coins.self, url: url) { response in
            complete(response.coins)
        }
    }
    
    func getMarkets(coinId: String, complete: @escaping([Market])->()) {
        let url = "\(BaseURL.url.rawValue)\(Request.markets.path)?coinId=\(coinId)"
        NetworkRequest.shared.requestAPI(type: [Market].self,
                                         url: url) { response in
            complete(response)
        }
    }
    
    func getExchanges(completion: @escaping([String])->()) {
        let url = "\(BaseURL.url.rawValue)\(Request.exchanges.path)"
        NetworkRequest.shared.requestAPI(type: Exchanges.self, url: url) { response in
            completion(response.supportedExchanges)
        }
    }
    
    func getNews(skip: Int, limit: Int, completion: @escaping([NewsElement])->()) {
        let url = "\(BaseURL.url.rawValue)\(Request.news.path)?skip=\(skip)&limit=\(limit)"
        NetworkRequest.shared.requestAPI(type: News.self, url: url) { response in
            completion(response.news)
        }
    }
    
    func getCurrencies(completion: @escaping([Currency])->()) {
        let url = "\(BaseURL.url.rawValue)\(Request.currencies.path)"
        NetworkRequest.shared.requestAPI(type: [Currency].self, url: url) { response in
            completion(response)
        }
    }
}
