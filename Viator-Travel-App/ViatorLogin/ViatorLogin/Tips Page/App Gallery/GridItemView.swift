//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// Reference:
// https://developer.apple.com/tutorials/sample-apps/imagegallery?changes=lat_2_6_6_8

import SwiftUI

struct GridItemView: View {
    let size: CGFloat
    let item: Item

    var body: some View {
        ZStack(alignment: .topTrailing) {
            if let url = item.url {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: size, height: size)
            }
        }
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = Bundle.main.url(forResource: "mushy1", withExtension: "jpg") {
            GridItemView(size: 50, item: Item(url: url))
        }
    }
}
