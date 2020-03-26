//
//  StockViewModel.swift
//  StockApp
//
//  Created by Praveen Bhaskar on 25/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import Foundation
import UIKit

class StockListViewModel: ObservableObject {
    
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 640)
    @Published var stocks: [StockViewModel] = []
    @Published var searchText: String = ""
    @Published var articles: [NewsArticleViewModel] = []
    var webservice: WebService = WebService()
    
    init() {
        fetchStocks()
        fetchNews()
    }
    
    func fetchStocks() {
        self.webservice.getStocks { (stocks) in
            guard let serviceStocks = stocks else {
                return
            }
            
            DispatchQueue.main.async {
                self.stocks = serviceStocks.map(StockViewModel.init)
            }
        }
    }
    
    func fetchNews() {
        self.webservice.getNews { (articles) in
            guard let articles = articles else {
                return
            }
            
            DispatchQueue.main.async {
                self.articles = articles.map(NewsArticleViewModel.init)
            }
        }
    }
    
}

