//
//  AdminOrdersViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 01.02.2023.
//

import Foundation

class AdminMainViewModel: ObservableObject {
    
    @Published var orders = [Order]()
    
    var currentOrder = Order(userID: "", date: Date(), status: OrderStatus.new.rawValue)

    func getOrder() {
        DatabaseService.shared.getOrder(by: nil) { result in
            switch result {
            case .success(let orders):
                self.orders = orders
                for (index, order) in self.orders.enumerated() {
                    
                    DatabaseService.shared.getPositions(by: order.id) { result in
                        switch result {
                            
                        case .success(let positions):
                            self.orders[index].positions = positions
                            print(self.orders[index].cost)
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
}
