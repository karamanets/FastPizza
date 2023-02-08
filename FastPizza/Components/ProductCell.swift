//
//  ProductSell.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct ProductCell: View {
    
    @State var image = UIImage(named: "pizza3")!
    
    var product: Product
    
    var body: some View {
        
        ZStack (alignment: .topTrailing){
            
            ZStack (alignment: .bottom) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180)
                    .cornerRadius(20)
                VStack (alignment: .leading){
                    Text(product.title)
                        .font(.title2 .monospaced() )
                        .lineLimit(1)
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
        .onAppear {
            StorageService.shared.downloadImage(id: self.product.id) { result in
                switch result {
                    
                case .success(let uiImage):
                    if let image = UIImage(data: uiImage) {
                        self.image = image
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
//                        🔱
struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Examples.shared.product)
    }
}
