//
//  HerosRowView.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import SwiftUI

struct HerosRowView: View {
    var hero:Character
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: hero.thumbnail.completePath)) { photoDownload in
                photoDownload
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading,.trailing], 5)

            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading,.trailing], 5)
                    .opacity(0.6)
                    .background(Color.gray)
            }
            .id("image")

            Text("\(hero.name)")
                .font(.title2)
                .bold()
                .padding(10)
                .id("text")
        }
        .padding()
        .background(Color.teal)
        .cornerRadius(10)
        

    }
}

struct HerosRowView_Previews: PreviewProvider {
    static var previews: some View {
        HerosRowView(hero: Character(id: 1, name: "Hit-Monkey", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: "jpg"), resourceURI: ""))
    }
}
