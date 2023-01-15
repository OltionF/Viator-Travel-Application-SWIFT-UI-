//
//  ViatorLoginApp.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 08/02/2022.
//

import SwiftUI
import Firebase

@main
struct ViatorLoginApp: App {
    
    // MARK - Properties
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @StateObject private var viewModel = LocationsViewModel()
    @StateObject private var exploreViewModel = ExploreViewModel()
    @StateObject private var dataModel = DataModel()
    
    // MARK - Body
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(viewModel)
                .environmentObject(exploreViewModel)
                .environmentObject(dataModel)

        }
    }
    
    class AppDelegate: UIResponder, UIApplicationDelegate {

      var window: UIWindow?

      func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          
        // Sets up firebase
        FirebaseApp.configure()

        return true
      }
    }
}
