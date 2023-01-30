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

    private var userReference: CollectionReference {
        return db.collection("users")
    }
    
    private var orderReference: CollectionReference {
        return db.collection("orders")
    }

    func setProfile(user: DataUser, completion: @escaping (Result<DataUser, Error>) -> Void ) {

        userReference.document(user.id).setData(user.representation) { error in

            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }

    func getProfile(completion: @escaping (Result<DataUser, Error>) -> Void ) {

        userReference.document(AuthService.shared.currentUser!.uid).getDocument { snapshot, error in

            guard let snap = snapshot else { return }
            guard let data = snap.data() else { return }
            guard let id = data["id"] as? String else { return }
            guard let name = data["name"] as? String else { return }
            guard let phone = data["phone"] as? Int else { return }
            guard let address = data["address"] as? String else { return }

            let user = DataUser(id: id, name: name, phone: phone, address: address)

            completion(.success(user))
        }
    }
    
    func setOrder(order: Order, completion: @escaping (Result<Order, Error>) -> Void ) {
        
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
    
    func setPositions(to orderID: String, positions: [Position], completion: @escaping (Result<[Position], Error>) -> Void ) {
        
        let positionsRef = orderReference.document(orderID).collection("positions")
        
        for position in positions {
            positionsRef.document(position.id).setData(position.representation)
        }
        completion(.success(positions))
    }
    
    func getOrder(by userID: String?, completion: @escaping (Result<[Order], Error>) -> Void ) {
        
        self.orderReference.getDocuments {  qSnap, error in
            
            if let qSnap = qSnap {
                var orders = [Order]()
                for doc in qSnap.documents {
                    if let userID = userID {
                        if let order = Order(doc: doc), order.userID == userID {
                            orders.append(order)
                        }
                    } else {
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
}
