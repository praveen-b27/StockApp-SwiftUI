//
//  StockListview.swift
//  StockApp
//
//  Created by Praveen Bhaskar on 25/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import SwiftUI

struct StockListview: View {
    
    var stocks: [StockViewModel]
        
    var body: some View {
        
        List(self.stocks, id: \.symbol) { stock in
            
            StockViewCell(stock: stock)
        }
    }
}


struct StockViewCell: View {
    
    var stock: StockViewModel
    
    
    var body: some View {
        
        return
            HStack {
                VStack(alignment: .leading) {
                    Text(stock.symbol)
                        .font(.custom("Arial", size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 5.0)
                    
                    Text(stock.description)
                        .font(.custom("Arial", size: 18))
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(stock.price)
                        .font(.custom("Arial", size: 22))
                        .foregroundColor(.white)
                        .padding(.bottom, 5.0)
                    
                    Button(stock.change) {
                        
                    }
                    .frame(width: 70)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding(5)
                }
            }
    }
}

struct StockListview_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let stock = Stock(symbol: "GOOG", description: "Google Stock", price: 1200, change: "+1.23")
        return StockListview(stocks: [StockViewModel(stock: stock)])
    }
}
