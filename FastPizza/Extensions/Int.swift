//
//  String.swift
//  FastPizza
//
//  Created by Alex Karamanets on 08/06/2023.
//

import Foundation

extension Int {
    
    /// Convert Int into a String Phone Number
    /// ```
    /// Convert 777,77,77 to 777-77-77
    /// ```
    func asPhoneNumber(pattern: String = "###-##-##", replaceCharacter: Character = "#") -> String {
        let number = String(self)
        var pureNumber = number.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: number)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replaceCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
}
