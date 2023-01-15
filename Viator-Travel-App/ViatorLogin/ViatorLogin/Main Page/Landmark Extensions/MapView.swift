//
//  MapView.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// Reference:
// https://developer.apple.com/documentation/mapkit/mkcoordinateregion
// https://developer.apple.com/documentation/mapkit/map

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        // Displays coordinate region on map view
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        // Creates a coordinate region with a span around the specified center coordinate.
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

