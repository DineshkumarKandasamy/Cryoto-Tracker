//
//  CurrencyViewModel.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 21.04.22.
//

import Foundation

class CurrencyViewModel {
    
    var currencyList = [Currency]()
    
    func getCurrencies(completion: @escaping()->()){
        WebService.shared.getCurrencies{ [unowned self] currencyList in
            self.currencyList = currencyList
            completion()
        }
    }
    
    func numberOfItems() -> Int {
        return currencyList.count
    }
    
    func itemAtCell(index: Int) -> Currency {
        return currencyList[index]
    }
    
}
