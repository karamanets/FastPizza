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
    
    @State private var size = "Medium"
    @State private var count = 1
    
    var body: some View {
        
        NavigationStack {
            VStack {
                VStack {
                    Image(viewModel.product.imageUrl)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .frame(maxWidth: .infinity, maxHeight: 250)
                        .shadow(radius: 3,x: 3,y: 3)
                }
                
                HStack {
                    Text("\(viewModel.product.title):")
                        .font(.system(size: 25) .monospaced())
                    Spacer()
                    Text("\(viewModel.getPrice(size: size)) $")
                        .font(.system(size: 25) .monospaced().bold())
                   
                }
                .padding(.horizontal, 50)
                
                HStack {
                    Picker("", selection: $size) {
                        ForEach(viewModel.sizes, id: \.self) { item in
                            Text(item)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal)
                
                HStack {
                    Stepper(value: $count, in: 1...20) {
                        Text("Amount:      \(count)")
                            .font(.system(size: 22) .monospaced())
                    }
                }
                .padding(.horizontal, 1)
                .padding()
                
                HStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.orange)
                        .frame(width: 280, height: 2)
                }
                
                HStack {
                    Button {
                        //
                    } label: {
                        Text("Add to cart")
                            .foregroundColor(.black)
                            .font(.system(size: 18) .bold())
                            .padding(.horizontal)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(14)
                            .shadow(radius: 3,x: 3,y: 3)
                    }
                }
                .padding(.top, 5)
                
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
                    .font(.system(size: 24) .bold())
                    .foregroundColor(.orange)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(50)
            }
            }
            .padding(.top, 30)
            .navigationTitle("Detail")
            .navigationBarTitleDisplayMode(.inline)
            
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
