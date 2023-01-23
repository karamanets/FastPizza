//
//  CatalogViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 19.01.2023.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    //MARK: fake catalog
    
    var popularProducts = [Product(id: "",
                                   title: "Chile",
                                   imageUrl: "pizza9",
                                   price: 33,
                                   description: "The best optional"),
                           Product(id: "1",
                                   title: "Diablo",
                                   imageUrl: "pizza7",
                                   price: 23,
                                   description: "The best optional"),
                           Product(id: "2",
                                   title: "Spicy",
                                   imageUrl: "pizza3",
                                   price: 43,
                                   description: "The best optional"),
                           Product(id: "3",
                                   title: "Hot fish",
                                   imageUrl: "pizza4",
                                   price: 65,
                                   description: "The best optional"),
                           Product(id: "4",
                                   title: "Meat",
                                   imageUrl: "pizza5",
                                   price: 27,
                                   description: "The best optional"),
                           Product(id: "5",
                                   title: "Vegan",
                                   imageUrl: "pizza6",
                                   price: 18,
                                   description: "The best optional")
    ]
}
