//
//  CatalogView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct CatalogView: View {
    
    var layout = [GridItem(.adaptive(minimum: 160), spacing: 30)]
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
            
            Section ("Popular") {
                ScrollView (.horizontal, showsIndicators: false) {

                    LazyHGrid(rows: layout, spacing: 16) {
                        ForEach(CatalogViewModel.shared.popularProducts) { item in
                            NavigationLink {
                                ProductDetailView(product: item)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }

                            
                            
                        }
                       
                    }
                    .padding(9)
                }
            }
                Section ("Pizza List") {
                    ScrollView (.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: layout) {
                            ForEach(CatalogViewModel.shared.popularProducts) { item in
                                NavigationLink {
                                    ProductDetailView(product: item)
                                } label: {
                                    ProductCell(product: item)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [Color.orange, Color.red],
                                       startPoint: .bottomLeading,
                                       endPoint: .topTrailing).opacity(0.4))
        }
        
    }
}
struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
