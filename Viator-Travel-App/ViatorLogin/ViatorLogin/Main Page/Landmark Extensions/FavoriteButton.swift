//
//  FavoriteButton.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//

import SwiftUI

struct FavoriteButton: View {
    // Modifies isFavourite variable in model to true/false
    @Binding var isSet: Bool
    
    var body: some View {
        // Button toggle changes bool var to true/false
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
