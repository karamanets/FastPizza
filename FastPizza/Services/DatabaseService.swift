//
//  DatabaseService.swift
//  FastPizza
//
//  Created by Alex Karamanets on 26.01.2023.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    
    static let shared = DatabaseService()
    
    private init() { }
    
    private let db = Firestore.firestore()
    
    private var userReference: CollectionReference { db.collection("users") }
    
    private var orderReference: CollectionReference { db.collection("orders") }
    
    private var productsReference: CollectionReference { db.collection("products") }
    
    func setProfile(user: DataUser, completion: @escaping (Result<DataUser, Error>) -> Void) {
        
        userReference.document(user.id).setData(user.representation) { error in
            
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(by userID: String? = nil, completion: @escaping (Result<DataUser, Error>) -> Void) {
        
        userReference.document(userID != nil ? userID! : AuthService.shared.currentUser!.uid).getDocument { snapshot, error in
            
            guard
                let snap = snapshot,
                let data = snap.data(),
                let id = data["id"] as? String,
                let name = data["name"] as? String,
                let phone = data["phone"] as? Int,
                let address = data["address"] as? String else { return }
            
            let user = DataUser(id: id, name: name, phone: phone, address: address)
            
            completion(.success(user))
        }
    }
    
    func setOrder(order: Order, completion: @escaping (Result<Order, Error>) -> Void) {
        
        orderReference.document(order.id).setData(order.representation) { error in
            
            if let error = error {
                completion(.failure(error))
            } else {
                self.setPositions(to: order.id, positions: order.positions) { result in
                    
                    switch result {
                        
                    case .success(let positions):
                        print(positions.count)
                        completion(.success(order))
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    func setPositions(to orderID: String, positions: [Position], completion: @escaping (Result<[Position], Error>) -> Void) {
        
        let positionsRef = orderReference.document(orderID).collection("positions")
        
        for position in positions {
            positionsRef.document(position.id).setData(position.representation)
        }
        completion(.success(positions))
    }
    
    func getOrder(by userID: String?, completion: @escaping (Result<[Order], Error>) -> Void) {
        /// String - optional, if it has userID -> get order user if nil -> get all orders
        self.orderReference.getDocuments {  qSnap, error in
            
            if let qSnap = qSnap {
                var orders = [Order]()
                for doc in qSnap.documents {
                    if let userID = userID {
                        if let order = Order(doc: doc), order.userID == userID {
                            orders.append(order)
                        }
                    } else {
                        ///Admin panel
                        if let order = Order(doc: doc) {
                            orders.append(order)
                        }
                    }
                }
                completion(.success(orders))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func getPositions(by orderID: String, completion: @escaping (Result<[Position], Error>) -> Void) {
        
        let position = orderReference.document(orderID).collection("positions")
        
        position.getDocuments { snap, error in
            
            if let querySnapshot = snap {
                var positions = [Position]()
                
                for item in querySnapshot.documents {
                    if let position = Position(doc: item) {
                        positions.append(position)
                    }
                }
                completion(.success(positions))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func setProducts(product: Product, image: Data, completion: @escaping (Result<Product, Error>) -> Void) {
        
        StorageService.shared.upload(id: product.id, image: image) { result in
            switch result {
            case .success(let sizeInfo):
                print(sizeInfo)
                self.productsReference.document(product.id).setData(product.representation) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(product))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
    }
    
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        
        self.productsReference.getDocuments { qSnap, error in
            
            guard let qSnap = qSnap else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            let docs = qSnap.documents
            var products = [Product]()
            
            for item in docs {
                guard let product = Product(doc: item) else { return }
                products.append(product)
            }
            completion(.success(products))
        }
    }
}
