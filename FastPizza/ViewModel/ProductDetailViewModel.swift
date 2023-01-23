//
//  ProductDetailViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 20.01.2023.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var sizes = ["Small","Medium","Large"]
    
    init(product: Product) {
        self.product = product
    }
    
    func getPrice(size: String) -> Int {
        switch size {
        case "Small" : return product.price
        case "Medium": return Int(Double(product.price) * 1.25)
        case "Large" : return Int(Double(product.price) * 1.5)
        default : return 0
        }
    }
}
