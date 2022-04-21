//
//  NewsViewModel.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 19.04.22.
//

import Foundation

class NewsViewModel {
    
    var newsList = [NewsElement]()
    
    func getNews(complete: @escaping()->()) {
        let path = "/news"
        let skip = 0
        let limit = 20
        
        WebService.shared.getNews(path: path, skip: skip, limit: limit) { newsList in
            self.newsList = newsList
            complete()
        }
    }
    
    func numberOfLines() -> Int {
        return newsList.count
    }
    
    func itemAtCell(index: Int) -> NewsElement {
        return newsList[index]
    }
    
}
    
    

