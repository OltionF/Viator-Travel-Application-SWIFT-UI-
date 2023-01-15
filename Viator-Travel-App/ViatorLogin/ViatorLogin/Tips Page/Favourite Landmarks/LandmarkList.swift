//  LandmarkList.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//

import SwiftUI

struct LandmarkList: View {
    
    // Properties
    @EnvironmentObject var exploreViewModel: ExploreViewModel
    @State private var showFavoritesOnly = false
    
    // Filters out landmark based on favorite selection
    var filteredLandmarks: [Landmark] {
        exploreViewModel.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                // Toggle for favorites only
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                // Loops through each landmark filtered to show favorite ones
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ExploreViewModel())
    }
}
