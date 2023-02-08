//
//  CatalogView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct CatalogView: View {
    
    @StateObject var viewModel = CatalogViewModel()
    
    var layout = [GridItem(.adaptive(minimum: 160), spacing: 30)]
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                Section  {
                    ScrollView (.horizontal, showsIndicators: false) {
                        
                        LazyHGrid(rows: layout, spacing: 16) {
                            ForEach(viewModel.products) { item in
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .padding(9)
                    }
                }
                .padding(.top, 40)
                Section {
                    ScrollView (.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: layout) {
                            ForEach(viewModel.products) { item in
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .padding()
                    }
                } header: {
                    Text("Popular")
                        .foregroundColor(.orange)
                        .font(.title3 .bold())
                        .offset(y: -15)
                }
            }
            .background(Image("background"))
            .ignoresSafeArea()
        }
        .onAppear {
            viewModel.getProducts()
        }
    }
}
struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
