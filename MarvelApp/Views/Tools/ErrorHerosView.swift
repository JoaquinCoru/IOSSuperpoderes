//
//  ErrorView.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 16/10/22.
//

import SwiftUI

struct ErrorHerosView: View {
    @EnvironmentObject var viewModel: RootViewModel
    
    private var textError:String
    
    init(error:String){
        textError = error
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
                viewModel.getHeros()
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

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorHerosView(error: "Prueba de error")
    }
}
