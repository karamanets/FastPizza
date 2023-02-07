//
//  ProductSell.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
        
        ZStack (alignment: .topTrailing){
            
            ZStack (alignment: .bottom) {
                Image(product.id)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180)
                    .cornerRadius(20)
                VStack (alignment: .leading){
                    Text(product.title)
                        .font(.title2 .monospaced() )
                    Text("\(product.price) $")
                        .font(.title2 .monospaced() .bold() )
                        .padding(.leading)
                }
                .padding(9)
                .frame(width: 180, alignment: .leading)
                .background(Color("Color1"))
                .cornerRadius(20)
            }
            .frame(width: 180, height: 240)
            .shadow(color: .black.opacity(0.9), radius: 4, x: 3, y: 3)
            
            Button {
                // add dish
            } label: {
                Image(systemName: "plus")
                    .padding(15)
                    .foregroundColor(.black)
                    .background(Color("Color1"))
                    .cornerRadius(50)
            }
            .padding()
        }
    }
}
//                        🔱
struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Examples.shared.product)
    }
}
