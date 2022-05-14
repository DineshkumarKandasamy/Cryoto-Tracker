//
//  ExchangesViewModel.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 20.04.22.
//

import Foundation


class ExchangesViewModel {
    
    var exchangeList = [String]()
    

    
    func getExchanges(complete: @escaping()->()) {
        WebService.shared.getExchanges() { [unowned self] exchangeList in
            self.exchangeList = exchangeList
            complete()
        }
    }
    
    func numberOfExchanges() -> Int {
        return self.exchangeList.count
    }
    
    func itemAtCell(index: Int) -> String {
        return self.exchangeList[index]
    }
    
    
    
}
