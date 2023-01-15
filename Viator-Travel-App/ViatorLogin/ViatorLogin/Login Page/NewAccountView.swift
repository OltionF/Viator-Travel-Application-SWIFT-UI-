//
//  NewAccountView.swift
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

struct NewAccountView: View {
    
    // Properties
    
    @Environment(\.presentationMode) var presentation
    
    @State var email: String = ""
    @State var password: String = ""
    @State var ValidatePassword: String = ""
    @State private var showAlert = false
    
    var Disabled: Bool {
        email.isEmpty || password.isEmpty || ValidatePassword.isEmpty
    }
    
    // Body
    
    var body: some View {
            ZStack{
                
                // Background colour
                Color.white
                    .ignoresSafeArea(edges: .all)
                
                // Main View
                VStack {
                    
                    // Text Fields
                    VStack(spacing: 10){
                        HStack {
                                Image(systemName: "person.fill").foregroundColor(.black)
                                   .padding()
                            TextField("Email", text: $email, prompt: Text("Enter email"))
                                   .frame(width: 280, height: 50, alignment: .center)
                               }.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                            Spacer().frame(width: 0, height: 10)
                        
                        HStack {
                                Image(systemName: "key.fill").foregroundColor(.black)
                                   .padding()
                            SecureField("Password", text: $password, prompt: Text("Enter password"))
                                   .frame(width: 280, height: 50, alignment: .center)
                               }.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                            Spacer().frame(width: 0, height: 10)
                        
                        HStack {
                                Image(systemName: "key").foregroundColor(.black)
                                   .padding()
                            SecureField("Password", text: $ValidatePassword, prompt: Text("Enter password again"))
                                   .frame(width: 280, height: 50, alignment: .center)
                               }.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                            Spacer().frame(width: 0, height: 10)
                    }
                    .padding()
                    .padding(.bottom, 16.0)
                    
                    // Buttons
                    VStack(spacing: 16){
                        
                        // Create account
                        Button {
                            createNewUser()
                        } label: {
                            Text("Create account")
                                .frame(maxWidth: .infinity)
                                .font(.title2)
                        }
                        .padding()
                        .foregroundColor(Disabled ? Color.gray : Color.white)
                        .background(Color.black)
            
                        .cornerRadius(16)
                        .disabled(Disabled)
                    }
                    .padding()
                    
                    Spacer()
                }
            }
        
            // Alert called if ShowAlert = True
            .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Invalid sign-up details"),
                        message: Text("Please enter details and try again.")
                    )
                }
            // Title
            .navigationTitle("Create New Account")
    }
    
    // Helpers
    
    private func createNewUser() {
        
        // Checks if both passwords match
        if password != ValidatePassword { return }
        
        // Check if passwords are empty
        if password.isEmpty { return }
        
        Auth.auth().createUser(withEmail: email, password: password) {authResult, error in
        
            // Prints out any errors
            if let err = error {
                
                // Called alert popup message
                showAlert = true
                print("Error : \(err.localizedDescription)")
                return
            }
            
            // Registered User
            print("Successfully registered user")
            
            // Bring user back to login
            presentation.wrappedValue.dismiss()
        }
    }
    
}

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
