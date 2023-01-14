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
                
                Image(product.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200)
                    .cornerRadius(20)
                
                VStack (alignment: .leading){
                    Text(product.title)
                        .font(.system(size: 19) .monospaced() )
                    
                    Text("\(product.price) $")
                        .font(.system(size: 22) .monospaced() .bold() )
                        .padding(.leading)
                }
                .padding()
                .frame(width: 200, alignment: .leading)
                .background(Color("Color1"))
                .cornerRadius(20)
            }
            .frame(width: 200, height: 330)
            .shadow(color: .black.opacity(0.5), radius: 4, x: 3, y: 3)
            
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
        ProductCell(product: Product(id: "",
                                     title: "4 cheese",
                                     imageUrl: "PizzaPR1",
                                     price: 33,
                                     description: "The best optional"))
    }
}
