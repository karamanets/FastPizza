//
//  ProductSell.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct ProductCell: View {
    
    @State var image: UIImage?
    
    var product: Product
    
    var body: some View {
        ZStack (alignment: .topTrailing){
            
            ZStack (alignment: .bottom) {
                
                if let image = image {
                    Image(uiImage: image )
                        .resizable()
                        .scaledToFill()
                        .frame(width: 170)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(.white, lineWidth: 0.25)
                        })
                        .shadow(color: .black.opacity(0.9), radius: 3, x: 3, y: 3)
                        
                } else {
                       ProgressView().tint(.red)
                    .frame(width: 170, height: 240)
                }
                
                VStack (alignment: .leading){
                    Text(product.title)
                        .font(.title2 .monospaced() )
                        .lineLimit(1)
                    Text("\(product.price) $")
                        .font(.title2 .monospaced() .bold() )
                        .padding(.leading)
                }
                .padding(9)
                .frame(width: 170, alignment: .leading)
                .background(Color("Color1"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .frame(width: 170, height: 240)
            
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
            getImage()
        }
    }
    
    func getImage() {
        if let savedImage = LocalFileManager.instance.getImage(imageName: product.id) {
            self.image = savedImage
        } else {
            DispatchQueue.global().async {
                StorageService.shared.downloadImage(id: self.product.id) { result in
                    switch result {
                    case .success(let uiImage):
                        if let image = UIImage(data: uiImage) {
                            LocalFileManager.instance.saveImage(image: image,
                                                                imageName: product.id)
                            DispatchQueue.main.async {
                                self.image = image
                            }
                        }
                    case .failure(let error):
                        print("[⚠️] Error: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}

//                     🔱
struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
