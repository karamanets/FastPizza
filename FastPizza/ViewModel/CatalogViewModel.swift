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
                            title: "4 cheese",
                            imageUrl: "PizzaPR1",
                            price: 33,
                            description: "The best optional"),
                    Product(id: "1",
                            title: "4 cheese",
                            imageUrl: "PizzaPR1",
                            price: 33,
                            description: "The best optional"),
                    Product(id: "2",
                            title: "4 cheese",
                            imageUrl: "PizzaPR1",
                            price: 33,
                            description: "The best optional"),
                    Product(id: "3",
                            title: "4 cheese",
                            imageUrl: "PizzaPR1",
                            price: 33,
                            description: "The best optional"),
                    Product(id: "4",
                            title: "4 cheese",
                            imageUrl: "PizzaPR1",
                            price: 33,
                            description: "The best optional"),
                    Product(id: "5",
                            title: "4 cheese",
                            imageUrl: "PizzaPR1",
                            price: 33,
                            description: "The best optional"),
                    Product(id: "6",
                            title: "4 cheese",
                            imageUrl: "PizzaPR1",
                            price: 33,
                            description: "The best optional")
    ]
}
