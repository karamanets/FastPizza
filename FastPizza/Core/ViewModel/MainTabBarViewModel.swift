//
//  MainTabBarViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 26.01.2023.
//

import Foundation
import FirebaseAuth

final class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
