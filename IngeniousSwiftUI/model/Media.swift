//
//  BreedImage.swift
//  BreedImage
//
//  Created by Karin Prater on 20.08.21.
//

import Foundation

/*
 "image": {
   "height": 1445,
   "id": "0XYvRd7oD",
   "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
   "width": 1204
 },
 */

struct Media: Codable {
    let mediaImage : [MediaImage]
    
    
    enum CodingKeys: String, CodingKey {
        case mediaImage = "media-metadata"
        
    }
    
}

struct MediaImage: Codable {
    let url : String
    let format : String
    
    
    
}
