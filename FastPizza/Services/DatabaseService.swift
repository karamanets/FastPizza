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

    func setUser(user: DataUser, completion: @escaping (Result<DataUser, Error>) -> Void ) {

        userReference.document(user.id).setData(user.representation) { error in

            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
}
