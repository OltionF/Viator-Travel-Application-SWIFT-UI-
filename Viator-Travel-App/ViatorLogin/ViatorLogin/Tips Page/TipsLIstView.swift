//
//  TipsLIstView.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 14/04/2022.
//

import SwiftUI

struct TipsLIstView: View {

    let spacing: CGFloat = 10
    @State private var numberOfRows = 3
    let tips: [Tip]

    init(){
        let url = Bundle.main.url(forResource: "tips",
            withExtension: "json")!
        let data = try! Data(contentsOf: url)
        tips = try! JSONDecoder().decode([Tip].self, from: data)
    }

    var body: some View {
        List(tips, id: \.text, children: \.children) { tip in
            if tip.children != nil {
                Label(tip.text, systemImage: "folder")
                    .font(.headline)
            } else {
                Text(tip.text)
            }
        }
    }
}

struct TipsLIstView_Previews: PreviewProvider {
    static var previews: some View {
        TipsLIstView()
    }
}
