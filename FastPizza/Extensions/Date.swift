//
//  Date.swift
//  FastPizza
//
//  Created by Alex Karamanets on 08/06/2023.
//

import Foundation

//MARK: Date Formator
extension Date {
    
    func asShortDateString(type: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        /// Type of date
        formatter.dateStyle = type
        /// Local "en" - English
        formatter.locale = Locale(identifier: "en")
        
        return formatter.string(from: self)
    }
}
