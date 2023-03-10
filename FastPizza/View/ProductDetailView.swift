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
    @State var image: UIImage?
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                VStack {
                    Spacer()
                    if image != nil {
                        Image(uiImage: image!)
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .frame(maxWidth: .infinity, maxHeight: 240)
                            .shadow(radius: 3,x: 3,y: 3)
                    } else {
                        ProgressView().tint(.red)
                            .frame(maxWidth: .infinity, maxHeight: 240)
                    }
                }
                
                HStack {
                    Text("\(viewModel.product.title):")
                        .font(.title .monospaced())
                        .foregroundColor(Color("Color1"))
                        .lineLimit(1)
                    Spacer()
                    Text("\(viewModel.getPrice(size: size)) $")
                        .font(.title .monospaced().bold())
                        .foregroundColor(Color("Color1"))
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
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background( Color("Color1").opacity(0.6))
                    .cornerRadius(30)
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
                        var position = Position(id: UUID().uuidString,
                                                product: viewModel.product,
                                                count: self.count)
                        position.product.price = viewModel.getPrice(size: size)
                        
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
                
                HStack {
                    Text(viewModel.product.description)
                        .lineLimit(5)
                        .font(.title3 .monospaced() .bold() .italic())
                        .foregroundColor(Color("Color1"))
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
                .cornerRadius(50) }
                Spacer(minLength: 50)
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(Image("background"))
            .ignoresSafeArea()
            .toolbar(.hidden, for: .tabBar)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            let queue = DispatchQueue(label: "queue", qos: .userInitiated, attributes: .concurrent)
            queue.async {
                StorageService.shared.downloadImage(id: self.viewModel.product.id) { result in
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
}
//                     ????
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Examples.shared.product))
    }
}
