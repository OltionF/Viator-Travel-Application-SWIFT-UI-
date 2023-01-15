//
//  CategoryRow.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    // Landmark model reference
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            // Name of category
            Text(categoryName)
                .font(Font.system(size: 18, weight: .medium, design: .serif))
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    // Loops through each item within that grouped set of values in dictionary key
                    // Passes landmark parameter for navigation link
                    ForEach(items) { landmark in
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ExploreViewModel().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[2].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
