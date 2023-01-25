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
    
    var body: some Scene {
        WindowGroup {
            AuthView()
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
