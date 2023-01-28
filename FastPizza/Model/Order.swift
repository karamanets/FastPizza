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
}
