//
//  Position.swift
//  FastPizza
//
//  Created by Alex Karamanets on 20.01.2023.
//

import Foundation
import FirebaseFirestore


struct Position: Identifiable {
    
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
       return product.price * self.count
    }
    
    var representation: [String: Any] {
        
        var temp = [String: Any]()
        temp["id"] = self.id
        temp["count"] = self.count
        temp["cost"] = self.cost
        temp["title"] = product.title
        temp["price"] = product.price
        
        return temp
    }
    
    internal init(id: String, product: Product, count: Int) {
        self.id = id
        self.product = product
        self.count = count
    }
    
    init?(doc: QueryDocumentSnapshot) {
        
        let data = doc.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        guard let price = data["price"] as? Int else { return nil }
        
        let product: Product = Product(id: "", title: title, imageUrl: "", price: price, description: "")
        
        guard let count = data["count"] as? Int else { return nil }
        
        self.id = id
        self.product = product
        self.count = count
    }
}
