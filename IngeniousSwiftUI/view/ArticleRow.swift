//
//  ArticleRow.swift
//  IngeniousSwiftUI
//
//  Created by Sharma, Sudhanshu-S on 15/10/2021.
//

import SwiftUI

@available(iOS 15.0, *)
struct ArticleRow: View {
    let article: ArticleResult
    let imageSize: CGFloat = 100
    var body: some View {
        HStack{
            if article.media?.count ?? 0 > 0 && article.media?[0].mediaImage[2].url != nil  {
                AsyncImage(url: URL(string: article.media![0].mediaImage[2].url)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                        
                     } else if phase.error != nil {
                         
                         Text(phase.error?.localizedDescription ?? "error")
                             .foregroundColor(Color.pink)
                             .frame(width: imageSize, height: imageSize)
                     } else {
                        ProgressView()
                             .frame(width: imageSize, height: imageSize)
                     }
                    
                }
            }else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(article.title)
                    .font(.headline)
                Text(article.published_date)
            }
        }
    }
}

struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ArticleRow(article: ArticleResult.example1())
                .previewLayout(.fixed(width: 400, height: 200))
        }
    }
}
