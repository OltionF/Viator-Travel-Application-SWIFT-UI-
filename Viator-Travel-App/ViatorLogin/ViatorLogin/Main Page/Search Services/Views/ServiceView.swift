//
//  ServiceView.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// References:
// https://developer.apple.com/documentation/mapkit/map
// https://developer.apple.com/documentation/mapkit/mapannotation
// https://developer.apple.com/documentation/mapkit/mkmapviewdelegate

import Foundation
import SwiftUI
import MapKit

// Responds to changes made on the map view
class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: ServiceView
    
    // Initialiser for map view
    init(_ control: ServiceView) {
        self.control = control
    }
    
    // Set region for user to be show on map
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        // Is the user on same view as annotation
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                // Checks if annotation is in same position as user
                if annotation is MKUserLocation {
                    
                    // Sets default viewable region for user
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
                    mapView.setRegion(region, animated: true)
                    
                }
            }
        }
        
    }
}

struct ServiceView: UIViewRepresentable {
    
    // Passes in Array of services
    let landmarks: [Service]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        // Shows user location
        map.showsUserLocation = true
        // Coordinator processes different functions for map view
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<ServiceView>) {
        //
        updateAnnotations(from: uiView)
    }
    
    // Updates the services on map
    private func updateAnnotations(from mapView: MKMapView) {
        // Removes old annotations
        mapView.removeAnnotations(mapView.annotations)
        // Adds new annotations to map for list of services fetched
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
    
}
