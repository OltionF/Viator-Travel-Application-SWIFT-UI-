//
//  MainView.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 08/02/2022.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    // Properties
    @EnvironmentObject private var viewModel: LocationsViewModel
    @EnvironmentObject private var dataModel: DataModel
    
    @Environment(\.presentationMode) var presentation
    @State private var selection = 0

    var body: some View {
        ZStack {
            
            // Switch cases used for custom nav bar
            // Depending on case navigates to selected view
            switch selection{
            case 0:
                ExploreView()
            case 1:
                DiscoverView()
            case 2:
                LocationsView()
            default:
                TipsView()
            }
            
            VStack{
                // Pushes nav bar to the bottom
                Spacer()
                
                HStack{
                    Spacer()
                    
                    // Sign Out button on nav bar
                    Button(action: {
                        let firebaseAuth = Auth.auth()
                        do {
                            try firebaseAuth.signOut()

                            // Bring user back to login
                            presentation.wrappedValue.dismiss()

                        } catch let signOutError as NSError {
                            print("Error signing out: %@", signOutError)
                        }
                    }) {
                        Image(systemName: "arrowshape.turn.up.left")
                            .foregroundColor(.white)
                    }
                    
                    // Rest of buttons grouped, calls MenuButtonView struct for layout
                    Group{
                    Spacer()
                    MenuButtonView(selection: $selection, id: 0, icon: "house")
                    Spacer()
                    MenuButtonView(selection: $selection, id: 1, icon: "airplane")
                    Spacer()
                    MenuButtonView(selection: $selection, id: 2, icon: "star")
                    Spacer()
                    MenuButtonView(selection: $selection, id: 3, icon: "list.bullet")
                    Spacer()
                    }
                }
                // Modifiers
                .font(.title)
                .frame(height: 30)
                .padding(.vertical)
                .background(Color.blue)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MenuButtonView: View{
    
    // Properties
    @Binding var selection: Int
    let id: Int
    let icon: String
    
    var isSelected: Bool{
        selection == id
    }
    
    var body: some View{
        Button {
            selection = id
        } label: {
            Image(systemName: icon)
                .font(.title)
            
        }
        .foregroundColor(isSelected ? .black : .white)
        .scaleEffect(isSelected ? 1.3 : 1)
        .animation(.spring())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
