//
//  DiscoverHScrollView.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 20/04/2022.
//

import SwiftUI

struct DiscoverHScrollView : View {
    // Properties
    @Binding var data : [TravelData]
    
    // For expanding view
    @Binding var show : Bool
    var size : CGRect
    
    var body: some View{
        
        HStack(spacing: 0){
            
            ForEach(self.data){i in
                
                ZStack(alignment: .bottom){
                    
                    Image(i.image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: self.size.width - 30, height: self.size.height)
                    .cornerRadius(25)
                    // Because fill will take extra space we avoid this by content shape
                    .contentShape(Rectangle())
                    .onTapGesture {
                        
                        withAnimation {
                            
                            // Open the expand view when image is tapped
                            self.show.toggle()
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 12){
                        
                        Text(i.place)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        HStack(spacing: 12){
                            
                            Image(systemName: "mappin.circle.fill")
                                .font(.system(size: 25, weight: .bold))
                            
                            Text(i.country)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .padding(.leading,5)
                            
                            Text("5")
                        }
                        
                        Text(i.details)
                    }
                    .padding(.horizontal,25)
                    .padding(.bottom,20)
                    .foregroundColor(.white)
                }
                // Fixed frame for carousel list
                .frame(width: self.size.width, height: self.size.height)
            }
        }
    }
}
