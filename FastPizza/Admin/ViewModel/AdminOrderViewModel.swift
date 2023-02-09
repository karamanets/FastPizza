//
//  AdminOrderViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 01.02.2023.
//

import Foundation

class AdminOrderViewModel: ObservableObject {
    
    @Published var order: Order
    @Published var user = DataUser(id: "", name: "", phone: 911, address: "")
    
    init(order: Order) { self.order = order }
    
    func getUserData() {
        DatabaseService.shared.getProfile(by: order.userID) { result in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
