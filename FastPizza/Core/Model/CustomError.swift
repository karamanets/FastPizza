//
//  CustomError.swift
//  FastPizza
//
//  Created by Alex Karamanets on 10/06/2023.
//

import Foundation

enum CustomError: LocalizedError {
    
    case badURLResponse(url: URL)
    case unowned
    case notExistImage
    
    var errorDescription: String? {
        switch self {
        case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
        case .unowned                     : return "[⚠️] Unowned error"
        case .notExistImage               : return "[⚠️] Image didn't found in folder"
        }
    }
}
