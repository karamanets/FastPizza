//
//  OrderView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 01.02.2023.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var viewModel: OrderViewModel
    
    var body: some View {
 
            VStack {
                VStack  {
                    VStack (alignment: .leading, spacing: 10) {
                        Text("Person : \(viewModel.user.name)")
                            .foregroundColor(.black)
                            .font(.title3.bold())
                        
                        Text("Phone : +380 \(viewModel.user.phone)")
                            .foregroundColor(.black)
                            .font(.title3)
                        
                        Text("Address : \(viewModel.user.address)")
                            .foregroundColor(.black)
                            .font(.title3  )
                           
                        Text("Amount : \(viewModel.order.cost)")
                            .foregroundColor(.black)
                            .font(.title3.bold())
                            .padding(.top, 8)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 180)
                .background(Color("Color1").opacity(0.5))
                .cornerRadius(30)
                .padding(8)
                
                if viewModel.order.positions.count == 0 {
                    List {
                        Text("Don't have any orders     🍕")
                            .font(.title )
                            .foregroundColor(.black)
                            .padding(12)
                            .background(Color("Color1").opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    
                } else {
                    List (viewModel.order.positions) { item in
                        HStack {
                            ProductCart(viewModel: item)
                        }
                        .foregroundColor(.black)
                        .padding(11)
                        .background(Color("Color1").opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .onAppear { viewModel.getUserData() }
                }
        }
        .background(Image("background"))
        .ignoresSafeArea()
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(order: Examples.shared.order))
    }
}
