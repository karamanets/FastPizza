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
                .font(.system(size: 20) .monospaced() )
            
            Text("\(viewModel.count)")
                .font(.system(size: 20) .bold())
                .padding(3)
                .background(Color.orange.opacity(0.4))
                .cornerRadius(50)
                .padding(.horizontal)
            
                Image(viewModel.product.imageUrl)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .frame(width: 70, height: 70)
                
                Text("\(viewModel.cost) $")
                    .font(.system(size: 20) .bold())
                    .frame(width: 67, alignment: .trailing)
        }
        .padding(.horizontal)
        .lineLimit(1)
    }
}

struct ProductCart_Previews: PreviewProvider {
    static var previews: some View {
        ProductCart(viewModel: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString, title: "4 cheese", imageUrl: "PizzaPR1", price: 33, description: "The best optional"), count: 3))
    }
}


