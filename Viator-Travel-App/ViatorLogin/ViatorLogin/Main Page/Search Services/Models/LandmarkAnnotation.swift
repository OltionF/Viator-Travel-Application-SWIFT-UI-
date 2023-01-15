//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// References:
// https://developer.apple.com/documentation/mapkit/mkannotation

import MapKit
import UIKit

// Displays annotation on map fetches by Service model
final class LandmarkAnnotation: NSObject, MKAnnotation {
    // Takes in title + Coordinate
    let title: String?
    let coordinate: CLLocationCoordinate2D

    // Uses service model to set up and add on map view
    init(landmark: Service) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
