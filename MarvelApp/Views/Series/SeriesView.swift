//
//  SeriesView.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 15/10/22.
//

import SwiftUI

struct SeriesView: View {

    @StateObject var viewModel:SeriesViewModel
    
    var body: some View {
        List{
            if let series = viewModel.series {
                ForEach(series) { serie in
                    SeriesRowView(serie: serie)
                }
            }
        }
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(viewModel: SeriesViewModel(characterId: 1, testing: true))
    }
}