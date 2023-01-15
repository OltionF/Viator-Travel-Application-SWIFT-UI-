//
//  SquareImage.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//

import SwiftUI

struct SquareImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 250, height: 250)
            .cornerRadius(10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        SquareImage(image: Image("rome"))
    }
}
