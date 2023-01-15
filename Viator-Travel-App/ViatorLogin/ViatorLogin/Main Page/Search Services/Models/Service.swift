//
//  Service.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// References:
// https://developer.apple.com/documentation/mapkit/mkplacemark

import Foundation
import MapKit

// Model set up for services
struct Service {
    // Placemark data includes information such as the country or region, state, city,
    // and street address associated with the specified coordinate
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    // Name of service
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    // Coordinate of service
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
