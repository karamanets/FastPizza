//
//  AuthService.swift
//  FastPizza
//
//  Created by Alex Karamanets on 25.01.2023.
//

import Foundation
import FirebaseAuth

class AuthService {

    static let shared = AuthService()

    private init() {}

    private let auth = Auth.auth()

    var currentUser: User? {
        return auth.currentUser
    }

    func SignUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void ) {

        auth.createUser(withEmail: email, password: password) { result, error in

            if let result = result {
                
                let dataUser = DataUser(id: result.user.uid, name: "", phone: 0, address: "")
                
                DatabaseService.shared.setProfile(user: dataUser) { resultUser  in
                    switch resultUser {
                        
                    case .success(_):
                        completion(.success(result.user))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func SignIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void ) {
        
        auth.signIn(withEmail: email, password: password) { result, error in
            
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
