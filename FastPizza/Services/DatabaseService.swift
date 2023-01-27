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
}
