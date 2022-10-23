//
//  SeriesRowView.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 15/10/22.
//

import SwiftUI

struct SeriesRowView: View {
    var serie:Serie
    
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: serie.thumbnail.seriePath)) { photoDownload in
                photoDownload
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 5)
                    .opacity(0.6)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 5)
                    .opacity(0.6)
            }
            .id("image")
            
            Text("\(serie.title)")
            #if os(watchOS)
                .font(.caption)
                .lineLimit(2)
            #else
                .font(.title)
            #endif
                .multilineTextAlignment(.center)
                .bold()
                .padding([.leading, .trailing], 8)
                .background(.orange)
                .opacity(0.8)
                .id("text")
                
                
        }
        .padding()
        .background(.gray)
        .cornerRadius(10)
           

    }
}

struct SeriesRowView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesRowView(serie: Serie(id: 1, title: "Captain Carter (2022)", description: "", startYear: 1, endYear: 2, rating: "5", type: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/40/621d39b76a244", thumbnailExtension: "jpg")))
    }
}
