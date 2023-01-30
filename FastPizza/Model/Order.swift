//
//  Order.swift
//  FastPizza
//
//  Created by Alex Karamanets on 28.01.2023.
//

import Foundation
import FirebaseFirestore

struct Order: Identifiable {
    
    var id = UUID().uuidString
    var userID: String
    var positions = [Position]()
    var date: Date
    var status: String
    
    var cost: Int {
        var sum = 0
        for item in positions {
            sum += item.cost
        }
        return sum
    }
    
    var representation: [String: Any] {
        var temp = [String: Any]()
        
        temp["id"] = self.id
        temp["userID"] = self.userID
        temp["date"] = Timestamp(date: date)
        temp["status"] = self.status
        
        return temp
    }
    
    init(id: String = UUID().uuidString,
         userID: String,
         positions: [Position] = [Position](),
         date: Date,
         status: String) {
        self.id = id
        self.userID = userID
        self.positions = positions
        self.date = date
        self.status = status
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let userID = data["userID"] as? String else { return nil }
        guard let date = data["date"] as? Timestamp else { return nil }
        guard let status = data["status"] as? String else { return nil }
        
        self.id = id
        self.userID = userID
        self.date = date.dateValue()
        self.status = status
    }
    
}
