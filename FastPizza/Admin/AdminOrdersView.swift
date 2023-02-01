//
//  AdminOrdersView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 01.02.2023.
//

import SwiftUI

struct AdminOrdersView: View {
    
    @StateObject var viewModel = AdminOrdersViewModel()
    @State private var isOrderViewShow = false
    
    var body: some View {
        
        VStack {
            
            VStack {
                if viewModel.orders.count == 0 {
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
                    List (viewModel.orders) { item in
                        HStack {
                            OrderCell(order: item)
                                .onTapGesture {
                                    viewModel.currentOrder = item
                                    isOrderViewShow.toggle()
                                }
                            Spacer()
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
                }
                
            }
            .padding(.top, 40)
        
            HStack {
                Button {
                    
                } label: {
                    Text("Exit Admin")
                        .foregroundColor(.black)
                        .font(.system(size: 18) .bold())
                        .padding(.horizontal)
                        .padding()
                        .background(Color.red.opacity(0.9))
                        .cornerRadius(14)
                        .shadow(radius: 3,x: 3,y: 3)
                }
            }
            .padding(.bottom, 30)
        }
        .background(Image("background"))
        .ignoresSafeArea()
        .onAppear {
            viewModel.getOrder()
        }
        .sheet(isPresented: $isOrderViewShow) {
            let order = OrderViewModel(order: viewModel.currentOrder)
            OrderView(viewModel: order)
        }
    }
}

struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}









