//
//  IngeniousSwiftUITests.swift
//  IngeniousSwiftUITests
//
//  Created by Sharma, Sudhanshu-S on 14/10/2021.
//

import XCTest
import Combine
@testable import IngeniousSwiftUI

class IngeniousSwiftUITests: XCTestCase {

    override func setUp() {
        
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_getting_articles_success(){
        //let result = Result<[Article], APIError>.success([Article.example1()])
        let result = Result<[Article], APIError>.success([Article.example1()])
        let article = ArticleFetcher(service: APIMockService(result: result))
        
        let promise = expectation(description: "getting article")
        
        article.$articles.sink { articles in
            if articles.count > 0 {
                promise.fulfill()
            }
            
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
    }
    
    
    
    func test_loading_error() {
        let result = Result<[Article], APIError>.failure(APIError.badURL)
        let article = ArticleFetcher(service: APIMockService(result: result))
        
        let promise = expectation(description: "show error message")
        article.$articles.sink { articles in
            if !articles.isEmpty {
                XCTFail()
            }
            
        }.store(in: &subscriptions)
        
        article.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
        
    }
}
