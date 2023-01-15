//
//  SearchView.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// References:
// https://www.youtube.com/watch?v=WTzBKOe7MmU&t=1445s
// https://developer.apple.com/documentation/mapkit/map
// https://developer.apple.com/documentation/mapkit/mklocalsearch

import SwiftUI
import MapKit

struct SearchView: View {
    
    // Properties
    // Initialise location manager to aquire user location
    @ObservedObject var locationManager = LocationManager()
    // Fetched services are marked with state
    @State private var landmarks: [Service] = [Service]()
    @State private var search: String = ""
    @State private var tapped: Bool = false
    
    // Fetches nearby services/landmarks
    private func getNearByLandmarks() {
        // Part of IOS framework used to request nearby services
        let request = MKLocalSearch.Request()
        // Set query for search
        request.naturalLanguageQuery = search
        
        // Passes in request made
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                // Array of MKMap items that are assigned to landmarks
                let mapItems = response.mapItems
                // Sets array of services to to be populated on map
                self.landmarks = mapItems.map {
                    // Returns services
                    Service(placemark: $0.placemark)
                }
            }
        }
    }
    
    func calculateOffset() -> CGFloat {
        // Sets offset for list frame if landmarks entered and gesture is tapped
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 3
        }
        else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    // Visual view of search view
    var body: some View {
        ZStack(alignment: .top) {
            
            // Feeds in service data to map view in parameter
            ServiceView(landmarks: landmarks)
            
            // Text field
            TextField("Search for something", text: $search, onEditingChanged: { _ in })
            {
                // Commit
                self.getNearByLandmarks()
            }
            // Styling
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset(y: 44)
            
            // Shows list of services fetched
            PlaceListView(landmarks: self.landmarks) {
                // On tap
                self.tapped.toggle()
            }
            .animation(.spring())
            // Offset moves up or down
            .offset(y: calculateOffset())
            
        }
        .padding(.bottom,30)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
