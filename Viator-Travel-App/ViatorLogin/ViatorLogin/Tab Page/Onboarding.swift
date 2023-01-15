//
//  Onboarding.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 10/04/2022.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    // Bool variable for onboarding
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View{
        TabView{
            // Calls PageView struct for each different page, parameters are filled in
            PageView(title: "Discover new destinations",
                     message: "There's a whole world for you to explore and with Viator, it'll make it easier to explore it.",
                     imageName: "transport1",
                     ShowsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding)
            
            PageView(title: "Flights at your leisure",
                     message: "Finding a destination to fly to as now as easy as 1, 2, 3. ",
                     imageName: "transport2",
                     ShowsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding)
            
            PageView(title: "Maps to explore",
                     message: "Use our map to explore different countries and see what they have to offer!",
                     imageName: "transport3",
                     ShowsDismissButton: false,
                     shouldShowOnboarding: $shouldShowOnboarding)
            
            PageView(title: "Home",
                     message: "So what are you waiting for? Let's get started.",
                     imageName: "transport4",
                     ShowsDismissButton: true,
                     shouldShowOnboarding: $shouldShowOnboarding)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView: View {
    
    // Define properties of struct
    let title: String
    let message: String
    let imageName: String
    let ShowsDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View{
        VStack{
            // Onboard Image
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .padding()
            
            // Onboard Title
            Text(title)
                .font(.system(size: 32, design: .serif))
                .padding()
            
            // Onboard Text
            Text(message)
                .font(.system(size: 24, design: .serif))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.secondaryLabel))
                .padding()
            
            // Final onboard page displays dismiss button which toggles Bool value to false
            if ShowsDismissButton {
                Button(action: {
                    shouldShowOnboarding.toggle()
                }, label: {
                    Text("Get Started")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(6)
                })
            }
        }
    }
}
