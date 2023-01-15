//
//  ExploreViewModel.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 16/04/2022.
//
// References:
// https://designcode.io/swiftui-advanced-handbook-data-from-json
// https://developer.apple.com/documentation/swift/dictionary/3127163-init

import Foundation
import Combine

final class ExploreViewModel: ObservableObject {
    // Load JSON data into application (designed to simulate APIs)
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    // Returns array of landmarks if "isFeatured" is true
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    // Dictionary that groups landmarks by category "rawvalue" which is unique value
    // e.g. 1: ["Rome", "Milan"], 2: ["London", "Manchester"]
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

// JSON initializer with error handling
// https://developer.apple.com/swift/blog/?id=37

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't find \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
