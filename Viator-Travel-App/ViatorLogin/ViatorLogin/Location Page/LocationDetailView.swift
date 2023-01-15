//
//  LocationDetailView.swift
//  ViatorMainViewPrototype
//
//  Created by Oltion Fazliu on 10/02/2022.
//
// References:
// https://www.youtube.com/watch?v=SG7P1x5Yr7A&list=PLwvDm4Vfkdpha5eVTjLM0eRlJ7-yDDwBk&index=8
// https://docs.swift.org/swift-book/LanguageGuide/Extensions.html

import SwiftUI
import MapKit

// Detailed view page for the location selected
struct LocationDetailView: View {
    
    // Properties
    let location: Location // Array of locations
    @EnvironmentObject private var viewModel:LocationsViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            VStack{
                // VStack shows image + title and description
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                VStack(alignment: .leading, spacing: 16) {
                    // Refers to extensions which display the data
                   titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
}

// Extensions for detailed view
extension LocationDetailView {
    
    private var imageSection: some View {
        TabView{
            // For each of the array of images set to the ID of destination, show in tab style
            ForEach(location.imageNames, id: \.self){ imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    // Title card for detail page
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    // Description for detail page
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            // Url links to the location.link data in model array
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
            
        }
    }
    
    private var mapLayer: some View{
        // Outputs a minimized map view of location
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: viewModel.mapSan)), annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
    }
    
    private var backButton: some View{
        Button{
            // Action returns to parent page
            dismiss()
        }label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations[0])
            .environmentObject(LocationsViewModel())
    }
}
