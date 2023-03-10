//
//  MapViewActionButton.swift
//  NOM-BEAR
//
//  Created by NomoteteS on 26.01.2023.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var showLocationSearchView : Bool
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                showLocationSearchView.toggle()
            }
        } label: {
            Image(systemName: showLocationSearchView ? "arrow.letf" : "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 5)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(showLocationSearchView: .constant(true))
    }
}
