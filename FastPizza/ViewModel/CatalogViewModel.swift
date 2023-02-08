//
//  CatalogViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 19.01.2023.
//

import Foundation
import UIKit

class CatalogViewModel: ObservableObject {
    
    @Published var products = [Product]()
    
    func getProducts() {
        DatabaseService.shared.getProducts { result in
            switch result {
                
            case .success(let products):
                self.products = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
