//
//  Date.swift
//  FastPizza
//
//  Created by Alex Karamanets on 08/06/2023.
//

import Foundation

//MARK: Date Formator
extension Date {
    
    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        /// Type of date
        formatter.dateStyle = .long
        /// Local "en" - English
        formatter.locale = Locale(identifier: "en")
        return formatter
    }
}
