//
//  CardView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct CartView: View {
    
    var viewModel: CartViewModel
    
    var body: some View {
        NavigationStack {
            
            Text("Card")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(colors: [Color.brown, Color.orange],
                                           startPoint: .bottomLeading,
                                           endPoint: .topTrailing).opacity(0.7))
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}
