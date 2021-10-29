//
//  ErrorView.swift
//  IngeniousSwiftUI
//
//  Created by Sharma, Sudhanshu-S on 14/10/2021.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var articleFetcher = ArticleFetcher()
    var body: some View {
        VStack {
            Text("🥲")
                .font(.system(size: 80))
            Text(articleFetcher.errorMessage ?? "")
            Button {
                articleFetcher.fetchAllArticles()
            } label: {
                Text("try again!")
            }
        }
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(articleFetcher: ArticleFetcher())
    }
}
