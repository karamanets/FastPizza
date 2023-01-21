//
//  Position.swift
//  FastPizza
//
//  Created by Alex Karamanets on 20.01.2023.
//

import Foundation


struct Position: Identifiable {
    
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
       return product.price * self.count
    }
}
