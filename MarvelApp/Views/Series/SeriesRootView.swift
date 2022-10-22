//
//  DetailView.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 16/10/22.
//

import SwiftUI

struct SeriesRootView: View {
    var characterName:String
    @StateObject var viewModel:SeriesViewModel
    
    var body: some View {
        switch viewModel.status{
            
        case Status.loading:
            LoaderView()
                .id("LoaderView")
        case Status.loaded:
            SeriesView(characterName: characterName, viewModel: viewModel)
                .id("SeriesView")
        case .error:
            ErrorSeriesView(error: "Error cargando series", seriesViewModel: viewModel)
                .id("ErrorSeriesView")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesRootView(characterName: "Peggy Carter", viewModel: SeriesViewModel(characterId: 1))
    }
}
