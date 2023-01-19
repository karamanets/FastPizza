//
//  ProductDetailView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 19.01.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Environment(\.dismiss) var goBack
    
    var product: Product
    
    var body: some View {
        
        NavigationStack {
            
            Text(product.title)
            
            
            Button {
                goBack()
            } label: {
                Text("Ok")
                    .padding()
                    .padding(.horizontal, 19)
                    .foregroundColor(.white)
                    .background(Color.orange.opacity(0.9))
                    .cornerRadius(30)
            }   
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(id: "",
                                           title: "3 cheese",
                                           imageUrl: "PizzaPR1",
                                           price: 33,
                                           description: "The best optional"))
    }
}
