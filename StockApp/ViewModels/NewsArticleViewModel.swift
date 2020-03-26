//
//  NewsArticleViewModel.swift
//  StockApp
//
//  Created by Praveen Bhaskar on 25/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import Foundation

struct NewsArticleViewModel {
    let article: Article
    
    var title: String {
        return self.article.title
    }
    
    var imageURL: String {
        return self.article.imageURL
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
}
