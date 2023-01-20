//
//  CartViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 20.01.2023.
//

import Foundation


class CartViewModel: ObservableObject {
    
    @Published var positions = [Position]()
    
    func addPosition(position: Position) {
        self.positions.append(position)
    }
}
