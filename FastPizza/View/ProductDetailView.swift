//
//  ProductDetailView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 19.01.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Environment(\.dismiss) var goBack
    
    var viewModel: ProductDetailViewModel
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                VStack {
                    Image(viewModel.product.imageUrl)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 250)
                        .cornerRadius(20)
                }
                .padding()
            
                HStack {
                    Text("\(viewModel.product.title):")
                        .font(.system(size: 25) .monospaced())
                    Spacer()
                    Text("\(viewModel.product.price) $")
                        .font(.system(size: 25) .monospaced().bold())
                   
                }
                .padding(.horizontal, 50)
                
                HStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.orange)
                        .frame(width: 280, height: 2)
                }
                
                HStack {
                    Text(viewModel.product.description)
                        .lineLimit(10)
                        .font(.system(size: 20) .monospaced() .bold() .italic())
                }
                .padding()
                .padding(.top, 10)
                Spacer()
                
            Button {
                goBack()
            } label: {
                Image(systemName: "arrowshape.turn.up.backward")
                    .font(.system(size: 29) .bold())
                    .foregroundColor(.orange)
                    .padding(.all, 20)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(50)
            }
            }
            .padding(.top, 30)
            .navigationTitle("Detail")
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [Color.brown, Color.orange],
                                       startPoint: .bottomLeading,
                                       endPoint: .topTrailing).opacity(0.7))
            .toolbar(.hidden, for: .tabBar)
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel:
                            ProductDetailViewModel(product:
                                    Product(id: "",
                                        title: "3 cheese",
                                        imageUrl: "PizzaPR1",
                                        price: 33,
                                        description: "The best optional, made for a long tame ago bat we don't now why, and you also might don't worry about it at all ! Be Happy me friend ")))
    }
}
