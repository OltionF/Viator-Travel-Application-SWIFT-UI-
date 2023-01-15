//
//  Location.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 08/02/2022.
//


import Foundation
import CoreLocation

struct Location: Identifiable, Equatable {
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        "\(name)_\(cityName)"
    }
    
    //Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
