//
//  CardView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct CartView: View {
    
    var viewModel: CartViewModel
    
    var body: some View {
        
            NavigationStack {
                List {
                    ForEach(viewModel.positions) { item in
                       ProductCart(viewModel: item)
                    }
            }
                .listStyle(.plain)
                .navigationTitle("Cart")
                
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
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}


//    .frame(maxWidth: .infinity, maxHeight: .infinity)
//    .background(LinearGradient(colors: [Color.brown, Color.orange],
//                               startPoint: .bottomLeading,
//                               endPoint: .topTrailing).opacity(0.7))
