//
//  DiscoverExpandVIew.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 20/04/2022.
//
// Reference:
// https://developer.apple.com/documentation/swiftui/link

import SwiftUI

// ExpandView

struct DiscoverExpandView : View {
    
    // Properties
    // Used to open URL links
    @Environment(\.openURL) var openURL
    @Binding var data : TravelData
    @Binding var show : Bool
    
    var body: some View{
        
        VStack{
            
            // Dismiss button
            ZStack(alignment: .bottomLeading) {
                
                Image(self.data.image)
                .resizable()
                .cornerRadius(25)
                
                Button(action: {
                    
                    // Dismissing the expand view
                    withAnimation{
                        self.show.toggle()
                    }
                    
                }) {
                    Image(systemName: "xmark")
                        .font(.headline)
                        .padding(16)
                        .foregroundColor(.primary)
                        .background(.thickMaterial)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                        .padding()
                    
                }
                .padding(.trailing)
                .padding(.top,
                    (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
            }
            
            HStack{
                
                // Destination pricing
                HStack(spacing: 15){
                    
                    Text("$ 450")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("(3 Days)")
                        .font(.title)
                }
                .padding(.leading, 20)
                
                Button(action: {
                    
                    // Activites website URL if selected
                    openURL(URL(string: "https://www.skyscanner.net/flights")!)
                }) {
                    
                    Text("Book Now")
                        .foregroundColor(.black)
                        .font(.system(size:  22))
                        .padding(.vertical, 25)
                        .frame(width: UIScreen.main.bounds.width / 2.5)
                        .background(Color("Color"))
                        .clipShape(CShape())
                    
                }
            }
            
            ScrollView{
                
                // Destination details
                VStack(alignment: .leading, spacing: 12){
                    
                    Text(self.data.place)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack(spacing: 12){
                        
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 25, weight: .bold))
                        
                        Text(self.data.country)
                            .foregroundColor(.gray)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .padding(.leading,5)
                        
                        Text("5")
                            .foregroundColor(.gray)
                    }
                    
                    Text(self.data.details)
                }
                .padding(.horizontal,25)
                .padding(.bottom,20)
                .foregroundColor(.black)
                .padding(.top)
            }
            
        }
    }
}

