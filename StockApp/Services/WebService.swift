//
//  WebServices.swift
//  StockApp
//
//  Created by Praveen Bhaskar on 25/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import Foundation

class WebService {
    
    init() { }
    
    func getStocks(completionBlocker: @escaping ([Stock]?) -> Void) {
        
        guard let url = URL(string: "https://silicon-rhinoceros.glitch.me/stocks") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, respose, error in
            
            guard let data = data, error == nil else {
                completionBlocker(nil)
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            if stocks != nil {
                DispatchQueue.main.async {
                    completionBlocker(stocks)
                }
            } else {
                completionBlocker(nil)
            }
        }.resume()
    }
    
    func getNews(completionBlocker: @escaping ([Article]?) -> Void) {
        
        guard let url = URL(string: "https://silicon-rhinoceros.glitch.me/top-news") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, respose, error in
            
            guard let data = data, error == nil else {
                completionBlocker(nil)
                return
            }
            
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            
            if articles != nil {
                DispatchQueue.main.async {
                     completionBlocker(articles)
                }
            } else {
                completionBlocker(nil)
            }            
        }.resume()
    }
    
}
