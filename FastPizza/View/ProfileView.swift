//
//  ProfileView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: CartViewModel
    @State private var alert = false
    
    var body: some View {
        
        VStack (alignment: .center) {
            Spacer(minLength: 50)
            
            HStack {
                Image("logo")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle() .stroke(Color("Color1"), lineWidth: 1))
                    .frame(width: 140, height: 140)
                    .foregroundColor(.orange.opacity(0.6))
                
                VStack {
                    Text("Alexander Karamanets")
                        .foregroundColor(.black)
                        .font(.title3.bold())
                        .padding()
                        .background(Color("Color1").opacity(0.5))
                        .cornerRadius(30)
                        .lineLimit(1)
                    
                    Text("+38 095-777-99-33")
                        .foregroundColor(.black)
                        .font(.title3.bold())
                        .padding(5)
                        .background(Color("Color1").opacity(0.5))
                        .cornerRadius(30)
                        .lineLimit(1)
                }
            }
            
            VStack {
                Text("Cupertino, California, U.S. Infinite Loop Cupertino, CA 95014 ")
                    .foregroundColor(.black)
                    .font(.title3.bold())
                    .padding()
                    .background(Color("Color1").opacity(0.5))
                    .cornerRadius(30)
            }
            .padding(.horizontal)
            .padding(.top)
            
            HStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 300, height: 4)
                    .foregroundColor(.orange.opacity(0.5))
            }
            .padding(.top)
            
            VStack {
                    if(viewModel.positions.isEmpty) {
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
                        List (viewModel.positions) { item in
                        HStack {
                            ProductCart(viewModel: item)
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
            
            HStack {
                Button {
                    self.alert.toggle()
                } label: {
                    Text("Go out")
                        .foregroundColor(.black)
                        .font(.system(size: 18) .bold())
                        .padding(.horizontal)
                        .padding()
                        .background(Color.red.opacity(0.9))
                        .cornerRadius(14)
                        .shadow(radius: 3,x: 3,y: 3)
                }
                .padding(.bottom, 90)
                .confirmationDialog("Do you want to go out ?", isPresented: $alert, titleVisibility: .visible) {
                    Button {
                        //
                    } label: {
                        Text("Yes")
                    }
                }
            }
        }
        .background(Image("background"))
        .ignoresSafeArea()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: CartViewModel.shared)
    }
}
