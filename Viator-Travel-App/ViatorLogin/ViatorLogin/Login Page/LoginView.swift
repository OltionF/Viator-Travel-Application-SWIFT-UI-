//
//  ContentView.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 12/04/2022.
//
// References:
// https://developer.apple.com/documentation/swiftui/alert
// https://developer.apple.com/documentation/swiftui/navigationlink
// https://firebase.google.com/docs/auth/ios/start
// https://firebase.google.com/docs/auth/ios/password-auth
// https://firebase.google.com/docs/auth/ios/email-link-auth
// https://firebase.google.com/docs/auth/ios/errors
// https://firebase.google.com/docs/auth/web/manage-users
// https://firebase.google.com/docs/auth/admin/email-action-links

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    // TO MAKE SURE ONBOARDING HAPPENS JUST ONCE USE BELOW
    //@AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    
    // Properties
    @State var email: String = ""
    @State var password: String = ""
    @State var shouldShowOnboarding: Bool = true
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    // Environment Objects
    @EnvironmentObject private var exploreViewModel: ExploreViewModel
    @EnvironmentObject private var viewModel: LocationsViewModel
    @EnvironmentObject private var dataModel: DataModel
    
    @State var showNewAccountView: Bool = false
    @State var showResetPasswordView: Bool = false
    @State var showMainView: Bool = false
    @State private var showAlert = false
    
    // Var bool used to check if both fields are empty
    var Disabled: Bool {
        email.isEmpty || password.isEmpty
        
    }
    
    // Body
    
    var body: some View {
        NavigationView {
            ZStack{
                
                // Calls player view function to loop background video
                PlayerView()
                    .ignoresSafeArea(.all)
                Color.black
                    .ignoresSafeArea(.all)
                    .opacity(0.2)
                
                // Links to other views
                NavigationLink(destination: NewAccountView(), isActive: $showNewAccountView, label: { EmptyView() })
                
                NavigationLink(destination: ResetPasswordView(), isActive: $showResetPasswordView, label: { EmptyView() })
                
                NavigationLink(destination: MainView().navigationBarHidden(true), isActive: $showMainView, label: { EmptyView() })
                
                
                // Main View
                VStack {
                    // Logo
                    Image("logo1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                    
                    // Text Fields
                    HStack{
                        Text("Hello ,")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 35))
                        
                        Spacer().frame(width: 240, height: 0)
                    }
                    
                    VStack(alignment: .leading){
                        
                        Text("Enter e-mail")
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                        HStack {
                            Image(systemName: "person.fill").foregroundColor(.white)
                                .padding()
                            // Sets value to $email property
                            TextField("Email", text: $email)
                                .frame(width: 280, height: 50, alignment: .center)
                                .accentColor(.white)
                            
                            
                        }
                        // Styling button + Fields
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                        )
                        
                    }
                    .foregroundColor(Color.white)
                    
                    
                    Spacer().frame(width: 0, height: 10)
                    
                    
                    
                    VStack (alignment: .leading){
                        
                        Text("Enter passsword")
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                        HStack {
                            Image(systemName: "key.fill").foregroundColor(.white)
                                .padding()
                            SecureField("Password", text: $password, prompt: Text("Enter password"))
                                .frame(width: 280, height: 50, alignment: .center)
                        }
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                        )
                    }
                    .foregroundColor(Color.white)
                    
                    Spacer().frame(width: 0, height: 10)
                    
                    // Buttons
                    VStack(spacing: 16){
                        
                        // Sign in button
                        Button {
                            signInUser()
                        } label: {
                            Text("Sign in")
                                .frame(maxWidth: .infinity)
                                .font(.title2.bold())
                        }
                        .padding()
                        // Button disabled and background set to gray to dentote
                        // Switches to white once both fields are entered
                        .foregroundColor(Disabled ? Color.gray : Color.white)
                        .background(Color.black)
                        
                        .cornerRadius(16)
                        .disabled(Disabled)
                        
                        // Create account
                        Button {
                            self.showNewAccountView = true
                        } label: {
                            Text("Create account")
                                .frame(maxWidth: .infinity)
                                .font(.title2)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(16)
                        
                        // Reset password
                        Button {
                            self.showResetPasswordView = true
                        } label: {
                            Text("Forgot password?")
                                .frame(maxWidth: .infinity)
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    .padding()
                }
            }
            
            // Title
            .navigationTitle("")
        }
        
        // Covers screen for onboarding process
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: { OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
        })
        
        // Alert called if ShowAlert = True
        .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Invalid login details"),
                    message: Text("Please enter details and try again.")
                )
            }
    }
    
    // Helpers
    
    private func signInUser() {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            // Prints out any errors on command screen
            if let err = error {
                
                // Called alert popup message
                showAlert = true
                print("Error : \(err.localizedDescription)")
                return
            }
            
            // Navigate to main page
            self.showMainView = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
