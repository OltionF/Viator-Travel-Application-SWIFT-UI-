//
//  LandmarkRow.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//

import SwiftUI

struct LandmarkRow: View {
    // Reference landmark array
    var landmark: Landmark
    
    var body: some View {
        
        // Row of landmarks in favorite section
        HStack {
            // Image of landmark in row
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ExploreViewModel().landmarks
    
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[1])
            LandmarkRow(landmark: landmarks[2])
        }
    }
}
