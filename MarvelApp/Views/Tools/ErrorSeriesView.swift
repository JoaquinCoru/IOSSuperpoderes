//
//  ErrorSeriesView.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 16/10/22.
//

import SwiftUI

struct ErrorSeriesView: View {
    @ObservedObject var viewModel:SeriesViewModel
    
    private var textError:String
    
    init(error:String, seriesViewModel:SeriesViewModel){
        textError = error
        viewModel = seriesViewModel
    }
    
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "exclamationmark.bubble")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 200, height: 200)
                .padding()
            Text(textError)
                .foregroundColor(.red)
                .font(.headline)
            Spacer()
            Button {
                //Volver al login...
                viewModel.getSeriesForCharacter()
                viewModel.status = .loading

            } label: {
                Text("Reintentar")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x:20, y:15)
            }

        }
    }
}

struct ErrorSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorSeriesView(error: "Prueba de error", seriesViewModel: SeriesViewModel(characterId: 1))
    }
}
