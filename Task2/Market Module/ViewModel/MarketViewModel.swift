//
//  Market.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 19.04.22.
//

import Foundation


class MarketViewModel {
    private var marketList = [Market]()
    

    var coinId: String!
    
    func getMarkets(completion: @escaping()->()) {
        WebService.shared.getMarkets(coinId: coinId) { [unowned self]  marketList in
            self.marketList = marketList
            completion()
        }
    }
    
    func numberOfLine() -> Int {
        marketList.count
    }
    
    func itemAtCell(index: Int) -> Market {
        marketList[index]
    }
}
