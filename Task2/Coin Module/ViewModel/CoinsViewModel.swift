//
//  CurrenciesViewModel.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 18.04.22.
//

import Darwin

class CoinsViewModel {
    private var coins = [Coin]()
    
    var skip = 0
    let limit = 20
    var isFetchFinish = false
    let currency = "USD"
    
    func getCoins(completion: @escaping()->()) {
        if !isFetchFinish {
            WebService.shared.getCoins(skip: skip,
                                       limit: limit,
                                       currency: currency) { [unowned self] coinList in
                self.skip += 1
                if !coinList.isEmpty {
                    for coin in coinList {
                        self.coins.append(coin)
                    }
                } else {
                    self.isFetchFinish = true
                }
                completion()
            }
        }
    }
    
    func resetValues() {
        skip = 0
        isFetchFinish = false
        coins.removeAll()
    }
    
    func numberOfRowsInSection() -> Int {
        return coins.count
    }
    
    func itemsAtCell(index: Int) -> Coin? {
        return coins[index]
    }
}
