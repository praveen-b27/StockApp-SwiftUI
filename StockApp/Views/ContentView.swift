//
//  ContentView.swift
//  StockApp
//
//  Created by Praveen Bhaskar on 25/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView: View {
            
    @ObservedObject var stockListVM: StockListViewModel = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        
        UITableViewCell.appearance().backgroundColor = UIColor.black

        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
    }
    var body: some View {
        
        let filteredStocks = self.stockListVM.stocks.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter{
            $0.symbol.starts(with: self.stockListVM.searchText.uppercased())
        }
        
        return NavigationView {
            
            ZStack() {
                Color.black
                VStack {
                    Text("March 25 2020")
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .padding(EdgeInsets(top: 0, leading: 20.0, bottom: 0, trailing: 0))
                    SearchView(searchterm: self.$stockListVM.searchText)
                    StockListview(stocks: filteredStocks)
                }.offset(y: 40)
                
                NewsArticleView(articles: self.stockListVM.articles, onDragBegin: {value in
                    self.stockListVM.dragOffset = value.translation
                }, onDragEnd: {value in
                    
                    
                    if value.translation.height < 0 {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 100)
                    } else {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 640)
                    }
                    
                }).animation(.spring())
                    .offset(y: self.stockListVM.dragOffset.height)
                    

            }
                
            .navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set.bottom)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
