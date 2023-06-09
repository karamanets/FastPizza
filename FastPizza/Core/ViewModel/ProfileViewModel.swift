//
//  ProfileViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 27.01.2023.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    
    @Published var profile: DataUser
    @Published var orders: [Order] = [Order]()
    
    init(profile: DataUser) {
        self.profile = profile
    }
    
    func getOrders() {
        DatabaseService.shared.getOrder(by: AuthService.shared.currentUser?.uid) { result in
            
            switch result {
            case .success(let orders):
                self.orders = orders
                for (index, order) in self.orders.enumerated() {
                    DatabaseService.shared.getPositions(by: order.id) { result in
                        
                        switch result {
                            
                        case .success(let positions):
                            self.orders[index].positions = positions
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
