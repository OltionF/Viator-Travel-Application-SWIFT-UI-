//
//  TipsView.swift
//  ViatorMainViewPrototype
//
//  Created by Oltion Fazliu on 10/02/2022.
//
// References:
// https://developer.apple.com/documentation/SwiftUI/View/sheet(isPresented:onDismiss:content:)

import SwiftUI

struct TipsView: View {

    // Properites
    @EnvironmentObject private var dataModel: DataModel
    @State private var showQA = false
    @State private var showFavourites = false
    @State private var showGallery = false

    var body: some View {
            VStack{
                
                // Tips page layout
                Text("Tips Page")
                    .font(Font.system(size: 23, weight: .medium, design: .serif))
                    .foregroundColor(.black)
                    .font(.title)
                
                // Struct made for button layout of tips page
                ImageButtonView(title: "Frequent Q&A's", image: "verona"){
                    
                    // Once bool set to true sheet is presented with view
                    showQA = true
                }
                .sheet(isPresented: $showQA){
                    TipsLIstView()
                }

                ImageButtonView(title: "Check your favourites", image: "kyoto"){
                    showFavourites = true
                }
                .sheet(isPresented: $showFavourites){
                    LandmarkList().navigationBarHidden(true) // Hids nav bar
                }

                NavigationLink(destination: GridView().navigationBarHidden(false)) {
                    
                    // Navigation link with modifiers for overlay
                    Image("Tokyo")
                        .resizable()
                        .frame(width: 350)
                        .scaledToFit()
                        .cornerRadius(20)
                        .overlay(
                            Text("Photo Gallery")
                                .font(Font.system(size: 23, weight: .medium, design: .serif))
                                .foregroundColor(.white)
                                .font(.title)
                        )
                }
            }
            .padding(.bottom,40)
            .frame(width: UIScreen.main.bounds.width)
    }
}

struct ImageButtonView: View{

    // Properties for image button
    let title: String
    let image: String
    let action: () -> Void


    var body: some View{
        
        // Takes in parameters such as action, name and title
        Button(action: action) {
            ZStack {
                Image(image)
                    .resizable()
                    .frame(width: 350)
                    .scaledToFit()
                    .cornerRadius(20)

                Text(title)
                    .font(Font.system(size: 23, weight: .medium, design: .serif))
                    .foregroundColor(.white)
                    .font(.title)
            }
        }
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
