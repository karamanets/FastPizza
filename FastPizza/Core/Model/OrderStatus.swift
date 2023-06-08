//
//  OrderStatus.swift
//  FastPizza
//
//  Created by Alex Karamanets on 28.01.2023.
//

import Foundation

enum OrderStatus: String, CaseIterable {
    
    case new = "New order"
    case cooking = "In process"
    case delivery = "Delivering"
    case completed = "Completed"
    case cancelled = "Cancelled"
}
