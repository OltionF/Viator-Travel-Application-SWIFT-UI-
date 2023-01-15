//
//  ResetPasswordView.swift
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

struct ResetPasswordView: View {
    
    // Properties
    
    @Environment(\.presentationMode) var presentation
    
    @State var email: String = ""
    @State private var showAlert = false
    
    var Disabled: Bool {
        email.isEmpty
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
                    HStack {
                            Image(systemName: "person").foregroundColor(.black)
                               .padding()
                        TextField("Email", text: $email, prompt: Text("Enter email"))
                               .frame(width: 280, height: 50, alignment: .center)
                           }.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                        Spacer().frame(width: 0, height: 10)
                    
                    // Buttons
                    VStack(spacing: 16){
                        
                        // Create account
                        Button {
                            resetPassword()
                        } label: {
                            Text("Reset password")
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
            .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Invalid reset details"),
                        message: Text("Please enter details and try again.")
                    )
                }
            // Title
            .navigationTitle("Reset Password")
    }
    
    // MARK - Helpers
    
    private func resetPassword() {
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            
            // Prints out any errors
            if let err = error {
                
                // Called alert popup message
                showAlert = true
                print("Error : \(err.localizedDescription)")
                return
            }
            
            print("Reset password")
            
            // Bring user back to login
            presentation.wrappedValue.dismiss()
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
