//
//  ArticleFetcher.swift
//  IngeniousSwiftUI
//
//  Created by Sharma, Sudhanshu-S on 14/10/2021.
//

import Foundation

class ArticleFetcher: ObservableObject {
    @Published var articles = Article(results: [])
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init (service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllArticles()
    }
    
    func fetchAllArticles(){
        isLoading = true
        errorMessage = nil
        let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=PNSTMQ7ab1eV6CJpdVEriA9X9t6wWv9f")
        service.fetchArticles(url: url) {[unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error.description)
                case .success(let articles):
                    print(articles)
                    self.articles = articles
                }
            }
            
            
        }
    }
    //MARK: preview helpers
    
    static func errorState() -> ArticleFetcher{
        let fetcher = ArticleFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> ArticleFetcher {
        let fetcher = ArticleFetcher()
        fetcher.articles.results = [ArticleResult.example1()]
        return fetcher
    }
}
