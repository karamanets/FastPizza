//
//  ProductCart.swift
//  FastPizza
//
//  Created by Alex Karamanets on 21.01.2023.
//

import SwiftUI

struct ProductCart: View {
    
    let viewModel: Position
    
    var body: some View {
        
        HStack  {
            Text("📌 \(viewModel.product.title)")
                .font(.title2 .monospaced() )
            Spacer()
            Text("\(viewModel.count)")
                .font(.title3 .bold())
                .padding(3)
                .background(Color.orange.opacity(0.4))
                .cornerRadius(50)
                .padding(.horizontal)
                Text("\(viewModel.cost) $")
                    .font(.title3 .bold())
                    .frame(width: 45, alignment: .trailing)
        }
        .padding(.horizontal)
        .cornerRadius(20)
        .lineLimit(1)
    }
}

struct ProductCart_Previews: PreviewProvider {
    static var previews: some View {
        ProductCart(viewModel: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString, title: "4 cheese", imageUrl: "PizzaPR1", price: 33, description: "The best optional"), count: 3))
    }
}


