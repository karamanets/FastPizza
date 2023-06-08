//
//  Product.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import Foundation
import FirebaseFirestore

struct Product: Identifiable, Equatable {
    
    var id         : String
    var title      : String
    var price      : Int
    var description: String
    
    var representation: [String: Any] {
        var temp = [String: Any]()
        temp["id"] = self.id
        temp["title"] = self.title
        temp["price"] = self.price
        temp["description"] = self.description
        return temp
    }
    
    internal init(id: String = UUID().uuidString,
                  title: String,
                  price: Int,
                  description: String) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let id = data["id"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        guard let price = data["price"] as? Int else { return nil }
        guard let description = data["description"] as? String else { return nil }
        self.id = id
        self.title = title
        self.price = price
        self.description = description
    }
}
