//
//  SearchView.swift
//  StockApp
//
//  Created by Praveen Bhaskar on 25/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchterm: String
    
    var body: some View {
        
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            
            TextField("Search", text: $searchterm)
                .foregroundColor(Color.primary)
            .padding(10)
            
            Spacer()
            
        }.foregroundColor(Color.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .padding(10)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchterm: .constant(""))
    }
}
