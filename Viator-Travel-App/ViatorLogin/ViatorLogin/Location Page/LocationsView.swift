//
//  LocationsView.swift
//  ViatorMainViewPrototype
//
//  Created by Oltion Fazliu on 10/02/2022.
//
// References:
// https://www.youtube.com/watch?v=Jhf3CNs8I-I&list=PLwvDm4Vfkdpha5eVTjLM0eRlJ7-yDDwBk&index=1
// https://developer.apple.com/documentation/mapkit/
// https://docs.swift.org/swift-book/LanguageGuide/Extensions.html

import SwiftUI
import MapKit

struct LocationsView: View {
    
    // References array of locations from model
    @EnvironmentObject private var viewModel: LocationsViewModel
    var body: some View {
        ZStack{
            // Refers to map layer extension which produces map view
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0){
                Spacer()
                // Preview of locations
                locationsPreviewStack
                
            }
        }
        // Upon selecting a location a sheet popups up showing the detailed view of page
        .sheet(item: $viewModel.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
        .padding(.bottom,40)
    }
    
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {    
    private var mapLayer: some View{
        // Map references geolocation of destination and annotates this
        Map(coordinateRegion: $viewModel.mapRegion,
            annotationItems: viewModel.locations,
            // Annotates all location in area
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                // Calls custom annotation icon to be viewed
                LocationMapAnnotationView()
                    .scaleEffect(viewModel.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        viewModel.showNextLocation(location: location)
                    }
            }
        })
    }
    
    private var locationsPreviewStack: some View {
        ZStack{
            // For each of the locations in the array model, a preview stack is shown
            ForEach(viewModel.locations){ location in
                
                // From the stack, if the location is equal to the model, show
                // preview stack of this location
                if viewModel.mapLocation == location {
                LocationPreviewView(location: location)
                    .shadow(color: .black.opacity(0.3), radius: 20)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}
