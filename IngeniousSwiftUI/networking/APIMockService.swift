//
//  APIMockService.swift
//  IngeniousSwiftUI
//
//  Created by Sharma, Sudhanshu-S on 15/10/2021.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result : Result<Article, APIError>
    
    func fetchArticles(url : URL?, completion: @escaping(Result<Article, APIError>) -> Void){
        completion(result)
    }
    
}
