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
                NavigationStack {
                    List (viewModel.positions) { position in
                        HStack {
                            ProductCart(viewModel: position)
                            Spacer()
                        }
                        .foregroundColor(.black)
                        .padding(11)
                        .background(Color("Color1").opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .swipeActions {
                            Button {
                                viewModel.positions.removeAll { item in
                                    item.id == position.id
                                }
                            } label: {
                                Text("Remove")
                            }.tint(.red)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Image("background") .offset(y: -7.4) )
                    .listStyle(.plain)
                    .navigationTitle("Cart")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.hidden, for: .navigationBar)
                }
            VStack {
                HStack {
                    Text("AMOUND :")
                        .font(.title3 .monospaced() .bold())
                    Spacer()
                    Text("\(viewModel.cost) $")
                        .font(.title3 .monospaced() .bold())
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
                        //
                    } label: {
                        Text("Cancel")
                            .font(.title3 .bold() .monospaced())
                            .padding()
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            .background(Color.red)
                            .cornerRadius(25)
                            .shadow(radius: 3,x: 3,y: 3)
                    }
                    Button {
                        //
                    } label: {
                        Text("Order")
                            .font(.title3 .bold() .monospaced())
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
        .overlay(Group {
            if(viewModel.positions.isEmpty) {
                ZStack() {
                    Image("background")
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
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}

