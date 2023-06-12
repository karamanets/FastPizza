//
//  CardView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct CartView: View {

    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
           
            cartRow
            
            cartInfo
        }
        .overlay(Group {
            if(viewModel.positions.isEmpty) {
                ZStack() {
                    customBackground()
                    Text("Add some Pizza 🍕")
                        .foregroundColor(.black)
                        .font(.title .monospaced() .bold())
                        .padding()
                        .background(Color("Color1").opacity(0.4))
                        .cornerRadius(30)
                }
            }
        })
        .ignoresSafeArea()
    }
}
//                     🔱
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}

//MARK: - Component

extension CartView {
    
    private var cartRow: some View {
        VStack {
            Spacer(minLength: 90)
            List {
                ForEach (viewModel.positions) { position in
                    HStack {
                        ProductCart(viewModel: position)
                        Spacer()
                    }
                }
                .onDelete(perform: viewModel.removeRow(at: ))
                .foregroundColor(.black)
                .padding(11)
                .background(Color("Color1").opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .navigationBar)
        }
        .background{ customBackground() }
        .ignoresSafeArea()
    }
    
    private var cartInfo: some View {
        VStack {
            HStack {
                Text("AMOUND :")
                    .font(.title3 .monospaced() .bold())
                    .foregroundColor(.orange)
                Spacer()
                Text("\(viewModel.cost) $")
                    .font(.title3 .monospaced() .bold())
                    .foregroundColor(.orange)
            }
            .padding()
            .padding(.horizontal)
            
            HStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.orange)
                    .frame(width: 280, height: 2)
            }
            
            HStack {
                Button {
                    viewModel.removeAll()
                } label: {
                    Text("Cancel")
                        .font(.headline .bold() .monospaced())
                        .padding()
                        .padding(.horizontal)
                        .foregroundColor(.black)
                        .background(Color.red)
                        .cornerRadius(25)
                        .shadow(radius: 3,x: 3,y: 3)
                }
                Button {
                    var order = Order(userID:
                                        AuthService.shared.currentUser!.uid,
                                      date: Date(),
                                      status: OrderStatus.new.rawValue)
                    order.positions = self.viewModel.positions
                    
                    DatabaseService.shared.setOrder(order: order) { result in
                        switch result {
                            
                        case .success(let order):
                            print(order.cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    
                } label: {
                    Text("Order")
                        .font(.headline .bold() .monospaced())
                        .padding()
                        .padding(.horizontal, 45)
                        .foregroundColor(.black)
                        .background(Color.green)
                        .cornerRadius(25)
                        .shadow(radius: 3,x: 3,y: 3)
                }
            }
            .padding(.vertical)
            .padding(.bottom, 70)
        }
    }
}
