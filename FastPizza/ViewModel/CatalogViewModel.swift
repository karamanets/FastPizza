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
    
    var popularProducts = Examples.shared.catalog
}
