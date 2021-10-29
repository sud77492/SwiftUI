//
//  ArticleDetailView.swift
//  IngeniousSwiftUI
//
//  Created by Sharma, Sudhanshu-S on 15/10/2021.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: ArticleResult
    let imageSize: CGFloat = 300
    var body: some View {
        ScrollView {
            VStack {
                if article.media?[0].mediaImage[2].url != nil {
                    if #available(iOS 15.0, *) {
                        AsyncImage(url: URL(string: article.media![0].mediaImage[2].url)) { phase in
                            if let image = phase.image {
                                image.resizable()
                                    .scaledToFit()
                                    .frame( height: imageSize)
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
                    } else {
                        // Fallback on earlier versions
                    }
                }else {
                    Color.gray.frame(height: imageSize)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(article.title)
                        .font(.headline)
                    Text(article.byline)
                        .font(.footnote)
                    Text(article.abstract)
                    
                    
                    HStack {
                        Text("Energy level")
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "star.fill")
                                .foregroundColor(5 > id ? Color.accentColor : Color.gray )
                        }
                    }
                    
                    Spacer()
                }.padding()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
        
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: ArticleResult.example1())
    }
}
