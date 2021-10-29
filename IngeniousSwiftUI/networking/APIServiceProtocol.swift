//
//  APIServiceProtocol.swift
//  IngeniousSwiftUI
//
//  Created by Sharma, Sudhanshu-S on 15/10/2021.
//

import Foundation

protocol APIServiceProtocol {
    
    func fetchArticles(url : URL?, completion: @escaping(Result<Article, APIError>) -> Void)
     
        
}
