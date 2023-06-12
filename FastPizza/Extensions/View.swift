//
//  View.swift
//  FastPizza
//
//  Created by Alex Karamanets on 10/06/2023.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    
    func customBackground() -> some View {
        GeometryReader { geometry in
            Image("background")
                .frame(width: geometry.size.width, alignment: .center)
                .ignoresSafeArea()
        }
    }
}
