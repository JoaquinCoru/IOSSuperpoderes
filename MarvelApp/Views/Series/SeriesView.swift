//
//  SeriesView.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 15/10/22.
//

import SwiftUI

struct SeriesView: View {
    var characterName:String

    @StateObject var viewModel:SeriesViewModel
    
    var body: some View {
        List{
            if let series = viewModel.series {
                ForEach(series) { serie in
                    SeriesRowView(serie: serie)
                }
            }
        }
        .navigationBarTitle("Series \(characterName)")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(characterName: "Captain Carter",viewModel: SeriesViewModel(characterId: 1, testing: true))
    }
}
