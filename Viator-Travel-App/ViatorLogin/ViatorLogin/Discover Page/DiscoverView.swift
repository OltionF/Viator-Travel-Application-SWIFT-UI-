//
//  DiscoverView.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 04/02/2022.
//
// References:
// Used for custom transition & Discover UI template - https://morioh.com/p/2a6cbe1fd7bc
// https://developer.apple.com/documentation/swiftui/geometryreader

import SwiftUI

struct DiscoverView : View {
    
    // Data structure used to display in discover page
    // Meant to reflect API data fetched
    @State var data = [
        
        TravelData(id: 0, image: "image 1", country: "Britian", place: "London", details:"The Shard, also referred to as the Shard of Glass, Shard London Bridge and formerly London Bridge Tower, is a 72-storey skyscraper, designed by the Italian architect Renzo Piano, in Southwark, London, that forms part of the Shard Quarter development."),
        
        TravelData(id: 1, image: "Lisbon", country: "Portugal", place: "Lisbon", details:"Lisbon is Portugal’s hilly, coastal capital city. From imposing São Jorge Castle, the view encompasses the old city’s pastel-colored buildings, Tagus Estuary and Ponte 25 de Abril suspension bridge. Nearby, the National Azulejo Museum displays 5 centuries of decorative ceramic tiles. Just outside Lisbon is a string of Atlantic beaches, from Cascais to Estoril."),
        
        TravelData(id: 2, image: "Rome", country: "Italy", place: "Rome", details:"Rome is the capital city of Italy. It is also the capital of the Lazio region, the centre of the Metropolitan City of Rome, and a special comune named Comune di Roma Capitale."),
        
        TravelData(id: 3, image: "New York", country: "USA", place: "New York", details:"New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial and cultural centers. Its iconic sites include skyscrapers such as the Empire State Building and sprawling Central Park. Broadway theater is staged in neon-lit Times Square."),
        
        TravelData(id: 4, image: "berlin-1", country: "Germany", place: "Berlin", details:"Berlin, Germany’s capital, dates to the 13th century. Reminders of the city's turbulent 20th-century history include its Holocaust memorial and the Berlin Wall's graffitied remains. Divided during the Cold War, its 18th-century Brandenburg Gate has become a symbol of reunification. The city's also known for its art scene and modern landmarks like the gold-colored, swoop-roofed Berliner Philharmonie, built in 1963.")
    ]
    
    @State var index = 0
    
    @State var show = false
    
    var body: some View{
        
        ZStack{
            VStack{
                HStack{
                    
                    Text("Discover")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("\(self.index + 1)/\(self.data.count)")
                        .foregroundColor(.gray)
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                // Geometry reader that confirms to each item in carousel
                GeometryReader{g in
                    // Passes sample data parameters
                    DiscoverCarousel(data: self.$data, index: self.$index, show: self.$show, size: g.frame(in: .global))
                }
                // Padding modifiers
                .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 10)
                .padding(.bottom,30)
                Spacer()
            }
            
            // Hiding the view when expand view appears
            .opacity(self.show ? 0 : 1)
            
            // Current index will give current card
            DiscoverExpandView(data: self.$data[self.index], show: self.$show)
            
            // Shrinking the view in background
            .scaleEffect(self.show ? 1 : 0)
            .frame(width: self.show ? nil : 0, height: self.show ? nil : 0)
        }
        .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}

// Sample data
struct TravelData : Identifiable{
    
    var id : Int
    var image : String
    var country : String
    var place : String
    var details : String
    
}

// Custom Shape
struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.bottomRight], cornerRadii: CGSize(width: 55, height: 55))
        
        return Path(path.cgPath)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
