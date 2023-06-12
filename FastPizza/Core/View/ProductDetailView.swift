//
//  ProductDetailView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 19.01.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    var vm: ProductDetailViewModel
    
    @State private var size = "Medium"
    @State private var count = 1
    
    @Environment(\.dismiss) var goBack
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                productImage
                
                productPrice
                
                productSize
                
                productAmount
                
                divider
                
                addProductButton
                
                aboutProduct
                Spacer()
                
            }
            .safeAreaInset(edge: .bottom, alignment: .center, spacing: 10, content: {
                goBackButton
            })
            .navigationBarTitleDisplayMode(.inline)
            .background{ customBackground() }
            .ignoresSafeArea()
            .toolbar(.hidden, for: .tabBar)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            vm.getImage()
        }
    }
}
//                     🔱
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(vm: ProductDetailViewModel(product: Examples.shared.product))
    }
}

//MARK: - Component
extension ProductDetailView {
    
    private var productImage: some View {
        VStack {
            Spacer()
            if let image = vm.image {
                Image(uiImage: image)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity, maxHeight: 240)
                    .shadow(color: .black, radius: 5, x: 5, y: 5)
            } else {
                ProgressView().tint(.red)
                    .frame(maxWidth: .infinity, maxHeight: 240)
            }
        }
    }
    
    private var productPrice: some View {
        HStack {
            Text("\(vm.product.title):")
                .font(.title .monospaced())
                .foregroundColor(Color("Color1"))
                .lineLimit(1)
            Spacer()
            Text("\(vm.getPrice(size: size)) $")
                .font(.title .monospaced().bold())
                .foregroundColor(Color("Color1"))
        }
        .padding(.horizontal, 50)
    }
    
    private var productSize: some View {
        HStack {
            Picker("", selection: $size) {
                ForEach(vm.sizes, id: \.self) { item in
                    Text(item)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding(.horizontal)
    }
    
    private var productAmount: some View {
        HStack {
            Stepper(value: $count, in: 1...20) {
                Text("Amount:      \(count)")
                    .font(.system(size: 22) .monospaced())
                    .foregroundColor(.black)
            }
            .padding()
            .background( Color("Color1").opacity(0.6))
            .cornerRadius(30)
        }
        .padding(.horizontal, 1)
        .padding()
    }
    
    private var divider: some View {
        HStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.orange)
                .frame(width: 280, height: 2)
        }
    }
    
    private var addProductButton: some View {
        HStack {
            Button {
                var position = Position(id: UUID().uuidString,
                                        product: vm.product,
                                        count: self.count)
                position.product.price = vm.getPrice(size: size)
                
                CartViewModel.shared.addPosition(position: position)
                goBack()
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
    }
    
    private var aboutProduct: some View {
        HStack {
            Text(vm.product.description)
                .lineLimit(5, reservesSpace: true)
                .font(.title3 .monospaced() .bold() .italic())
                .foregroundColor(Color("Color1"))
        }
        .padding()
    }
    
    private var goBackButton: some View {
        VStack {
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
        .padding(.bottom)
    }
}
