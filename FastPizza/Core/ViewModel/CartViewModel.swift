//
//  CartViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 20.01.2023.
//

import Foundation


final class CartViewModel: ObservableObject {
    
    static let shared = CartViewModel()
    
    private init() {}
    
    @Published var positions = [Position]()
    
    var cost: Int {
        var sum = 0
        for position in positions {
            sum +=  position.cost
        }
        return sum
    }
    
    func addPosition(position: Position) {
        self.positions.append(position)
    }
    
    func removeRow(at offsets: IndexSet) {
        self.positions.remove(atOffsets: offsets)
    }
    
    func removeAll() {
        self.positions.removeAll()
    }
}
