//
//  APIService.swift
//  IngeniousSwiftUI
//
//  Created by Sharma, Sudhanshu-S on 14/10/2021.
//

import Foundation
import SwiftUI

struct APIService: APIServiceProtocol {
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void){
        guard let url = url else {
            
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode){
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                    
                    
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
            
        }

        task.resume()
    }
    
    func fetchArticles(url : URL?, completion: @escaping(Result<Article, APIError>) -> Void){
        guard let url = url else {
            
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            print(data)
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode){
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let articles = try decoder.decode(Article.self, from: data)
                    completion(Result.success(articles))
                    
                    
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
            
        }

        task.resume()

    }
    
}
