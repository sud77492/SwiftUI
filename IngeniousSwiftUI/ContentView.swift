//
//  ContentView.swift
//  IngeniousSwiftUI
//
//  Created by Sharma, Sudhanshu-S on 14/10/2021.
//

import SwiftUI

struct TestData: Identifiable {
    var id = UUID()
    var title: String
    var items: [String]
}

struct ContentView: View {
    @StateObject var articleFetcher = ArticleFetcher()
    let mygroups = [
            TestData(title: "Search", items: ["Search Articles"]),
            TestData(title: "Popular", items: ["Most Viewed","Most Shared","Most Emailed"])
        ]
    var body: some View {
//        if articleFetcher.isLoading {
//            LoadingView()
//        }else if articleFetcher.errorMessage != nil {
//            ErrorView()
//        }else{
//            ArticleListView(articles: articleFetcher.articles.results)
//        }
        NavigationView{
            List {
                ForEach(mygroups) { gr in
                    Section(header: Text(gr.title),
                            footer: Text("") ) {
                        
                        ForEach(gr.items, id: \.self, content: { item in
                            NavigationLink {
                                if articleFetcher.isLoading {
                                    LoadingView()
                                }else if articleFetcher.errorMessage != nil {
                                    ErrorView()
                                }else{
                                    ArticleListView(articles: articleFetcher.articles.results)
                                }
                            } label: {
                                Text(item)
                            }

                        })
                        
                    }
                }
            }.listStyle(PlainListStyle())
            .navigationTitle("Articles")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
