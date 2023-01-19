//
//  Product.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import Foundation

struct Product: Identifiable {
    
    var id         : String
    var title      : String
    var imageUrl   : String
    var price      : Int
    var description: String
    
//    var ordersCount: Int
//    var isRecommend: Bool
}
