//
//  LocationManager.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// References:
// https://developer.apple.com/documentation/corelocation/cllocationmanager
// https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate

import Foundation
import MapKit

// Class inherits from NSOBject to get access from location
class LocationManager: NSObject, ObservableObject {
    
    // Properties
    // CLLocationManger generates location-based events based on user location
    private let locationManager = CLLocationManager()
    // Get last user location
    @Published var location: CLLocation?
    
    override init() {
        // Initialiser for locationManager
        super.init()
        // Fetches user location
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization() // Asks for user permission
        self.locationManager.startUpdatingLocation()
        
    }
    
}


extension LocationManager: CLLocationManagerDelegate {
    
    // Manage user location to track user
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        // Assign user location to location
        self.location = location
    }
    
}
