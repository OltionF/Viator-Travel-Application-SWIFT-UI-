//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// Reference:
// https://developer.apple.com/tutorials/sample-apps/imagegallery?changes=lat_2_6_6_8

import SwiftUI

struct Item: Identifiable {
    
    // Uniquely identify each view so it can find and update them
    let id = UUID()
    // Url property that the app uses to identify the location of the corresponding image using a path to the file
    let url: URL

}

extension Item: Equatable {
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }
}
