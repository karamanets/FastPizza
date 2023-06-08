//
//  Examples.swift
//  FastPizza
//
//  Created by Alex Karamanets on 01.02.2023.
//

import Foundation
import UIKit

struct Examples {
    
    static let shared = Examples()
    
    private init() {}
    
    let order = Order(userID: "", date: Date(), status: OrderStatus.new.rawValue)
    
    let dataUser = DataUser(id: "777", name: "Lucius", phone: 999_99_99, address: "California CA, Central park building 7/2 apartment 11  ")
    
    let descriptionAdd = "The photo of the product must be 1280x1024 or larger"
    
    let uiImage = UIImage(named: "pizza5")
    
    let product = Product(id: "pizza5",
                          title: "3 cheese",
                          price: 33,
                          description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend "
    )
    
    let fakeCatalog = [Product(id: "pizza9",
                           title: "Chile",
                           price: 33,
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: "pizza7",
                           title: "Diablo",
                           price: 23,
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: "pizza3",
                           title: "Spicy",
                           price: 43,
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: "pizza4",
                           title: "Hot fish",
                           price: 65,
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: "pizza5",
                           title: "Meat",
                           price: 27,
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: "pizza6",
                           title: "Vegan",
                           price: 18,
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend")
]
}
