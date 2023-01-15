//
//  ExploreView.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// References:
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-environmentobject-to-share-data-between-views
// https://developer.apple.com/documentation/swiftui/list
// https://stackoverflow.com/a/59244354/6136968

import SwiftUI
import Firebase

struct ExploreView: View {
    
    // Properities
    @State private var isActive = false
    // SenvironmentObject(), which makes the object available in SwiftUI’s environment for that view plus any others inside it
    @EnvironmentObject var exploreViewModel: ExploreViewModel
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            // Container used to list items in order
            List {
                Image("Rome")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                    .overlay(
                        Text("Find something near you")
                            .font(Font.system(size: 30, weight: .medium, design: .serif))
                            .foregroundColor(.white)
                            .font(.title)
                    )
                    .onTapGesture { self.isActive.toggle() } // activate link on image tap
                    .background(NavigationLink(destination:  // link in background
                        SearchView(), isActive: $isActive) { EmptyView() })
                // .self is the unique Identifer for each object
                // Iterate through dictionary, sorting by just grouped values per key
                ForEach(exploreViewModel.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: exploreViewModel.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
            }
            .padding(.bottom,30)
            .listStyle(InsetListStyle())
            .navigationTitle("Explore")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .environmentObject(ExploreViewModel())
    }
}
