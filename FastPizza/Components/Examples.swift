//
//  Examples.swift
//  FastPizza
//
//  Created by Alex Karamanets on 01.02.2023.
//

import Foundation

struct Examples {
    
    static let shared = Examples()
    
    private init() {}
    
    let order = Order(userID: "", date: Date(), status: OrderStatus.new.rawValue)
    
    let dataUser = DataUser(id: "", name: "Lucius", phone: 999_99_99, address: "California CA, Central park building 7/2 apartment 11  ")
    
    let descriptionAdd = "The photo of the product must be 1280x1024 or larger"
    
    let product = Product(id: "",
                          title: "3 cheese",
                          imageUrl: "pizza5",
                          price: 33,
                          description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend "
    )
    
    let fakeCatalog = [Product(id: "",
                           title: "Chile",
                           imageUrl: "pizza9",
                           price: 33,
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: "1",
                           title: "Diablo",
                           imageUrl: "pizza7",
                           price: 23,
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: "2",
                           title: "Spicy",
                           imageUrl: "pizza3",
                           price: 43,
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: "3",
                           title: "Hot fish",
                           imageUrl: "pizza4",
                           price: 65,
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: "4",
                           title: "Meat",
                           imageUrl: "pizza5",
                           price: 27,
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend"),
                   Product(id: "5",
                           title: "Vegan",
                           imageUrl: "pizza6",
                           price: 18,
                           description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend")
]
}
