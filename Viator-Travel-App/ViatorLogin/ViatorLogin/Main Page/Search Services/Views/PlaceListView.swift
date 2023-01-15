//
//  PlaceListView.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// References:
// https://developer.apple.com/documentation/swiftui/tapgesture

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    // Pass in array of landmarks
    let landmarks: [Service]
    
    // Tap gesture
    var onTap: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                EmptyView()
            }
            // Create frame for list of services
            .frame(width: UIScreen.main.bounds.size.width, height: 60)
            .background(Color.blue)
            .gesture(TapGesture()
            .onEnded(self.onTap) // Tapping twice closes frame
            )
            
            // List of services
            List {
                ForEach(self.landmarks, id: \.id) { landmark in
                    
                    VStack(alignment: .leading) {
                        // Landmark name
                        Text(landmark.name)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                        Text(landmark.title)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                    }
                }
                
            }.animation(nil)
            
        }.cornerRadius(10)
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Service(placemark: MKPlacemark())], onTap: {})
    }
}
