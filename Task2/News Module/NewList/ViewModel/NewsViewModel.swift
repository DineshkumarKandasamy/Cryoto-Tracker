//
//  NewsViewModel.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 19.04.22.
//

import Foundation

class NewsViewModel {
    
    var newsList = [NewsElement]()
    
    let path = "/news"
    var skip = 0
    let limit = 10
    var isFetching = false
    
    func getNews(complete: @escaping()->()) {        
        if !isFetching {
            WebService.shared.getNews(path: path, skip: skip, limit: limit) { [unowned self] newsList in
                self.skip += 1
                if !newsList.isEmpty {
                    for newsList in newsList {
                        self.newsList.append(newsList)
                    }
                } else {
                    self.isFetching = true
                }
                complete()
            }
        }
    }
    
    func numberOfLines() -> Int {
        return newsList.count
    }
    
    func itemAtCell(index: Int) -> NewsElement {
        return newsList[index]
    }
    
}
    
    

