//
//  CategoryItem.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// Displays each destination in the corresponding category row

import SwiftUI

struct CategoryItem: View {
    // Landmark model reference
    var landmark: Landmark
    
    var body: some View {
        VStack {
            // Landmark iamge
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            // Landmark name
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ExploreViewModel().landmarks[1])
    }
}
