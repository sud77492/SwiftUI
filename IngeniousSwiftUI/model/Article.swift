//
//  Article.swift
//  IngeniousSwiftUI
//
//  Created by Sharma, Sudhanshu-S on 14/10/2021.
//

import Foundation

struct Article: Codable {
    //let id: Int
    var results : [ArticleResult]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
 
   
   
}

struct ArticleResult: Codable {
    //let id: Int
    let title: String
    let published_date : String
    let byline: String
    let abstract : String
    let media: [Media]?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case published_date
        case byline
        case abstract
        case media
    }
    
    
    init(title: String, published_date: String, byline: String, abstract: String, media: [Media]?){
        self.title = title
        self.published_date = published_date
        self.byline = byline
        self.abstract = abstract
        self.media = media
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        published_date = try values.decode(String.self, forKey: .published_date)
        byline = try values.decode(String.self, forKey: .byline)
        
        abstract = try values.decode(String.self, forKey: .abstract)
       
        
        media = try values.decodeIfPresent([Media].self, forKey: .media)
    }
 
    static func example1() -> ArticleResult {
        return ArticleResult(title: "title", published_date: "2021-10-12", byline: "byline", abstract: "abstract", media: [Media(mediaImage: [MediaImage(url: "https://static01.nyt.com/images/2021/10/11/opinion/11taylor1/11taylor1-thumbStandard.jpg", format: "tandard Thumbnail"), MediaImage(url: "https://static01.nyt.com/images/2021/10/11/opinion/11taylor1/11taylor1-thumbStandard.jpg", format: "tandard Thumbnail")])])
    }
   
}


