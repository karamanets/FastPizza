//
//  FastPizzaApp.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct FastPizzaApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    let adminId: [String] = [
        ///📌 Admin panel use ID
        "MKaQ3xwU67bSK6aQc1ilrxSoz4s1"
    ]
    
    var body: some Scene {
        WindowGroup {
           if let user = AuthService.shared.currentUser {
               
               if adminId.contains(user.uid) {
                   AdminMainView()
               } else {
                   let viewModel = MainTabBarViewModel(user: user)
                   MainTabBarView(viewModel: viewModel)
               }
            } else {
                AuthView()
            }
        }
    }
    class AppDelegate: NSObject, UIApplicationDelegate {
      func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
      }
    }
}
