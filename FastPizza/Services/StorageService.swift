//
//  StorageService.swift
//  FastPizza
//
//  Created by Alex Karamanets on 07.02.2023.
//

import Foundation
import FirebaseStorage

class StorageService {
    
    static let shared = StorageService()
    
    private init() {}
    
    private let storage = Storage.storage().reference()
    
    private var productsReference: StorageReference { storage.child("products") }
    
    func upload(id: String, image: Data, completion: @escaping (Result<String, Error>) -> Void) {
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        productsReference.child(id).putData(image, metadata: metaData) { metaData, error in
            
            guard let metaData = metaData else {
                if let error = error {
                    completion(.failure(error))
                }
                return }
            completion(.success("Size \(metaData.size)"))
        }
    }
    
    func downloadImage(id: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        productsReference.child(id).getData(maxSize: 2 * 1024 * 1024) { data, error in
            
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            completion(.success(data))
        }
    }
}
