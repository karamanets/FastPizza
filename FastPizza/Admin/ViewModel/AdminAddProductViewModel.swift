//
//  AdminAddProductViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 06.02.2023.
//

import SwiftUI
import PhotosUI

@MainActor class AdminAddProductViewModel: ObservableObject {
    
    @Published var image   : Image?
    @Published var imageSet: UIImage?
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            Task {
                try await loadImage(from: imageSelection)
            }
        }
    }
    
    func loadImage(from imageSelection: PhotosPickerItem?) async throws {
        
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    self.imageSet =  uiImage    
                    self.image = Image(uiImage: uiImage)
                }
            }
        } catch {
            print(error.localizedDescription)
            self.image = nil
        }
    }
}
