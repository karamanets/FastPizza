//
//  DataUser.swift
//  FastPizza
//
//  Created by Alex Karamanets on 26.01.2023.
//

import Foundation

struct DataUser: Identifiable {

    var id: String
    var name: String
    var phone: Int
    var address: String

    var representation: [String: Any] {
        var temp = [String: Any]()
        temp["id"] = self.id
        temp["name"] = self.name
        temp["phone"] = self.phone
        temp["address"] = self.address
        return temp
    }
}
