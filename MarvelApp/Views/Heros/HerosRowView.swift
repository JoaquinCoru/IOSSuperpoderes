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
                    .padding([.top,.leading,.trailing], 20)
                    .opacity(0.6)

            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding([.leading,.trailing], 20)
                    .opacity(0.6)
                    .background(Color.gray)
            }

            Text("\(hero.name)")
                .font(.title2)
                .bold()
                .padding(15)
        }
        .background(Color.gray)
        .cornerRadius(10)
        .padding(10)
    }
}

struct HerosRowView_Previews: PreviewProvider {
    static var previews: some View {
        HerosRowView(hero: Character(id: UUID(), name: "Hit-Monkey", resultDescription: "", modified: Date(), thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: "jpg"), resourceURI: ""))
    }
}
