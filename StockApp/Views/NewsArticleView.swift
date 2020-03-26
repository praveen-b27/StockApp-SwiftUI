//
//  NewsArticleView.swift
//  StockApp
//
//  Created by Praveen Bhaskar on 25/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    var articles: [NewsArticleViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Top News")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        
                    Text("From News")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(5)
                }
                Spacer()
            }.padding()
            .contentShape(Rectangle())
            .gesture(DragGesture()
                .onChanged(self.onDragBegin)
                .onEnded(self.onDragEnd))
            
            
            ScrollView {
                VStack {
                    
                    ForEach(self.articles, id: \.title) { article in
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(article.publication)
                                    .font(.custom("Arial", size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .lineLimit(nil)
                                Text(article.title)
                                    .font(.custom("Arial", size: 16))
                                    .foregroundColor(.white)
                                    .lineLimit(nil)
                            }.padding()
                            Spacer()
                            
                            URLImage(URL(string: article.imageURL)!, content: {
                                $0.image.resizable()
                            }).frame(width: 100, height: 100)
                        }
                        
                    }
                }.frame(maxWidth: .infinity)
                
            }
            
            
        }.frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            .background(Color(red: 27.0/255.0, green: 27.0/255.0, blue: 27.0/255.0))
            .cornerRadius(20)
        
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(title: "The Bull Market is Charging into 2020", imageURL: "https://i.ytimg.com/vi/gtkiRJwSN10/maxresdefault.jpg", publication: "THE WALSTREET JOURNAL")
        return NewsArticleView(articles: [NewsArticleViewModel(article: article)], onDragBegin: {_ in}, onDragEnd: {_ in})
    }
}
