//
//  LoaderView.swift
//  MarvelApp
//
//  Created by Joaquín Corugedo Rodríguez on 12/10/22.
//

import SwiftUI

struct LoaderView: View {
    
    @State private var animationAmount = 1.0
    
    @State private var animationValue = 100.0
    
    var body: some View {
        VStack(spacing: 50.0){

            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: animationValue, height: animationValue)
                .foregroundColor(.blue)
                .animation(.easeInOut(duration: 1)
                    .repeatForever(), value: animationValue)
                .onAppear{
                    animationValue = 60
                }
            Text("Cargando...")
                .foregroundColor(.blue)
                .font(.title2)
            
        }
        
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
