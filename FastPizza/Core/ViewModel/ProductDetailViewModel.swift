//
//  ProductDetailViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 20.01.2023.
//

import Foundation
import SwiftUI

final class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var image: UIImage?
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
    
    func getImage() {
        if let savedImage = LocalFileManager.instance.getImage(imageName: product.id,
                                                               folderName: LocalFileManager.instance.folder) {
            self.image = savedImage
        } else {
            DispatchQueue.global().async {
                StorageService.shared.downloadImage(id: self.product.id) { result in
                    switch result {
                    case .success(let uiImage):
                        if let image = UIImage(data: uiImage) {
                            LocalFileManager.instance.saveImage(image: image,
                                                                imageName: self.product.id,
                                                                folderName: LocalFileManager.instance.folder)
                            DispatchQueue.main.async {
                                self.image = image
                            }
                        }
                    case .failure(let error):
                        print("[⚠️] Error: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
