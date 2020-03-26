//
//  Article.swift
//  StockApp
//
//  Created by Praveen Bhaskar on 25/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import Foundation

struct Article: Decodable {
    let title: String
    let imageURL: String
    let publication: String
}
