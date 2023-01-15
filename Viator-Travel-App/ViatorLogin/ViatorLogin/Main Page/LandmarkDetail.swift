//
//  LandmarkDetail.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// Reference:
// https://developer.apple.com/documentation/swiftui/fetchedresults/firstindex(of:)

import SwiftUI

struct LandmarkDetail: View {
    // Make model accessible to this view
    @EnvironmentObject var exploreViewModel: ExploreViewModel
    var landmark: Landmark
    
    // Returns the first index where the specified value appears in the collection
    var landmarkIndex: Int {
        exploreViewModel.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            // Map location of destination
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            // Image of destination
            SquareImage(image: landmark.image)
                // Modifiers
                .offset(y: -130)
                .padding(.bottom, -130)
            
            // Textual description of location
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $exploreViewModel.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.country)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding(.bottom,30)
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let exploreViewModel = ExploreViewModel()
    
    static var previews: some View {
        LandmarkDetail(landmark: exploreViewModel.landmarks[1])
            .environmentObject(exploreViewModel)
    }
}
