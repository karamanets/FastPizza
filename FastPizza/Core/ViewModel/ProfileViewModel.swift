//
//  ProfileViewModel.swift
//  FastPizza
//
//  Created by Alex Karamanets on 27.01.2023.
//

import Foundation
import SwiftUI
import PhotosUI

final class ProfileViewModel: ObservableObject {
    
    @Published var profile: DataUser
    @Published var orders: [Order] = [Order]()
    
    @MainActor @Published var image: Image?
    @MainActor @Published var imageSelection: PhotosPickerItem? {
        didSet {
            Task {
                try await loadTransferable(from:imageSelection)
            }
        }
    }
    
    init(profile: DataUser){
        self.profile = profile
    }
    
    func getOrders() {
        DatabaseService.shared.getOrder(by: AuthService.shared.currentUser?.uid) { result in
            
            switch result {
            case .success(let orders):
                self.orders = orders
                for (index, order) in self.orders.enumerated() {
                    DatabaseService.shared.getPositions(by: order.id) { result in
                        
                        switch result {
                            
                        case .success(let positions):
                            self.orders[index].positions = positions
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setProfile() {
        DatabaseService.shared.setProfile(user: self.profile) { result in
            switch result {
            case .success(let user):
                print("set profile \(user.name)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getProfile() {
        DatabaseService.shared.getProfile { result in
            switch result {
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    ///📌 Get image from gallery folder
    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws {
        
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    await MainActor.run {
                        image = Image(uiImage: uiImage)
                        
                        ///Save user image in FileManager
                        LocalFileManager.instance.saveImage(image: uiImage, imageName: "userPhoto")
                    }
                }
            }
        } catch let error {
            print(error.localizedDescription)
            await MainActor.run {
                image = nil
            }
        }
    }
    
    func getUserImage() async throws {
        do {
            guard let imageFromFolder = LocalFileManager.instance.getImage(imageName: "userPhoto") else {
                throw CustomError.notExistImage
            }
            
            await MainActor.run {
                image = Image(uiImage: imageFromFolder)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
