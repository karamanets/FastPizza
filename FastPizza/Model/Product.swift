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
    var price      : Int
    var description: String
    
//    var ordersCount: Int
//    var isRecommend: Bool
    
    var representation: [String: Any] {
        var temp = [String: Any]()
        temp["id"] = self.id
        temp["title"] = self.title
        temp["price"] = self.price
        temp["description"] = self.description
        return temp
    }
}
