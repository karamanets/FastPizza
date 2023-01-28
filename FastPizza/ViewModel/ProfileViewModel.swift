//
//  ProfileViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 27.01.2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: DataUser
    
    init(profile: DataUser) {
        self.profile = profile
    }
    
    func setProfile() {
        DatabaseService.shared.setProfile(user: self.profile) { result in
            
            switch result {
            case .success(let user):
                print("set profile \(user.name)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getProfile() {
        DatabaseService.shared.getProfile { result in
            
            switch result {
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
