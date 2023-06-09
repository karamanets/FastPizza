//
//  ProfileView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var vm: ProfileViewModel
    @State private var alert = false
    @State private var isShowAuth = false
    
    var body: some View {
        
        VStack (alignment: .center) {
            Spacer(minLength: 50)
            
            userInfo
            
            userAddress
            
            divider
            
            orders
            
            exitButton
            
            .fullScreenCover(isPresented: $isShowAuth) {
                AuthView()
            }
        }
        .background(Image("background"))
        .ignoresSafeArea()
        .onSubmit { vm.setProfile() }
        .onAppear {
            vm.getProfile()
            vm.getOrders()
        }
    }
}

//MARK: - Component
extension ProfileView {
    
    private var userInfo: some View {
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
                TextField("Name", text: $vm.profile.name)
                    .foregroundColor(.black)
                    .font(.title3.bold())
                    .padding()
                    .background(Color("Color1").opacity(0.5))
                    .cornerRadius(30)
                    .lineLimit(1)
                
                HStack {
                    Text("+380")
                        .foregroundColor(.black)
                        .font(.title3.bold())
                        .padding(5)
                        .background(Color("Color1").opacity(0.5))
                        .cornerRadius(30)
                        .lineLimit(1)
        
                    TextField("Phone", value: $vm.profile.phone, format: .number)
                        .keyboardType(.numbersAndPunctuation)
                        .foregroundColor(.clear)
                        .tint(.clear)
                        .overlay {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color("Color1").opacity(0.5))
                                    .cornerRadius(30)
                                HStack {
                                    
                                    Text("\(vm.profile.phone == 0 ? "Add Number" : vm.profile.phone.asPhoneNumber())")
                                        .foregroundColor(.black)
                                        .font(.title3.bold())
                                        .lineLimit(1)
                                        .padding(5)
                                    
                                    Text(vm.profile.phone == 0 ? "" : "🇺🇦")
                                }
                            }
                            .allowsHitTesting(false)
                        }
                }
            }
        }
    }
    
    private var userAddress: some View {
        VStack {
            TextField("Address", text: $vm.profile.address)
                .foregroundColor(.black)
                .font(.title3.bold())
                .padding()
                .background(Color("Color1").opacity(0.5))
                .cornerRadius(30)
        }
        .padding(.horizontal)
        .padding(.top)
    }
    
    private var divider: some View {
        HStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 300, height: 4)
                .foregroundColor(.orange.opacity(0.5))
        }
    }
    
    private var orders: some View {
        VStack {
            if vm.orders.count == 0 {
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
                List (vm.orders) { item in
                    HStack (alignment: .center) {
                        OrderCell(order: item)
                    }
                    .foregroundColor(.black)
                    .padding(15)
                    .background(Color("Color1").opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
        }
    }
    
    private var exitButton: some View {
        HStack {
            Button {
                self.alert.toggle()
            } label: {
                Text("Exit app")
                    .foregroundColor(.black)
                    .font(.system(size: 18) .bold())
                    .padding(.horizontal, 10)
                    .padding(8)
                    .background(Color.red.opacity(0.9))
                    .cornerRadius(14)
                    .shadow(radius: 3,x: 3,y: 3)
            }
            .padding(.bottom)
            .confirmationDialog("Do you want to go out ?", isPresented: $alert, titleVisibility: .visible) {
                Button {
                    AuthService.shared.signOut()
                    self.isShowAuth.toggle()
                } label: {
                    Text("Yes")
                }
            }
        }
        .padding(.bottom, 90)
    }
    
}
