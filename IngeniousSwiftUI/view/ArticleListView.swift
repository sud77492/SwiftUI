//
//  ArticleListView.swift
//  IngeniousSwiftUI
//
//  Created by Sharma, Sudhanshu-S on 14/10/2021.
//

import SwiftUI

struct ArticleListView: View {
    let articles: [ArticleResult]
    
    @State private var searchText: String = ""
    
    var filteredArticles: [ArticleResult] {
        if searchText.count == 0 {
            return articles
        } else {
            return articles.filter { $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
    var body: some View {
        //NavigationView {
            if #available(iOS 15.0, *) {
                List {
                    
                    ForEach(filteredArticles, id: \.title) { article in
                        NavigationLink {
                            ArticleDetailView(article: article)
                        } label: {
                            ArticleRow(article: article)
                        }
                        
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Articles")
                .searchable(text: $searchText)
            }
            
       // }
        
        
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(articles: ArticleFetcher.successState().articles.results)
    }
}
