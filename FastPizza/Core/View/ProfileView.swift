//
//  ProfileView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @StateObject var vm: ProfileViewModel
    
    @State private var alert = false
    @State private var isShowAuth = false
    @State private var addUserImage = false
    
    var body: some View {
        VStack {
            userInfo
            
            userAddress
            
            divider
            
            orders
        }
        .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: 0, content: {
            exitButton
        })
        .onSubmit { vm.setProfile() }
        .background{ customBackground() }
        .onAppear {
            vm.getProfile()
            vm.getOrders()
        }
        .task {
            try? await vm.getUserImage()
        }
        .fullScreenCover(isPresented: $isShowAuth) {
            AuthView()
        }
        .confirmationDialog("Do you want to quit the App?", isPresented: $alert, titleVisibility: .visible) {
            Button(role: .destructive) {
                AuthService.shared.signOut()
                self.isShowAuth.toggle()
            } label: {
                Text("Yes")
            }
        }
    }
}

//MARK: - Component
extension ProfileView {
    
    private var userInfo: some View {
        HStack {
            VStack {
                if let image = vm.image {
                    image
                        .resizable()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 5, x: 0, y: 0)
                } else {
                    Image("logo")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle() .stroke(Color("Color1"), lineWidth: 1))
                        .frame(width: 140, height: 140)
                        .foregroundColor(.orange.opacity(0.6))
                }
                
                HStack {
                    PhotosPicker(selection: $vm.imageSelection) {
                        Image(systemName: "gear")
                            .font(.headline)
                            .foregroundColor(.red)
                        
                        Text("Photo")
                            .foregroundColor(.black)
                            .font(.callout .bold())
                    }
                }
                .padding(5)
                .background(Color("Color1").opacity(0.5))
                .cornerRadius(30)
            }
            
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
                        OrderCell(order: item, formatter: .medium)
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
        ZStack {
            Button {
                self.alert.toggle()
            } label: {
                VStack {
                   Text("Exit")
                        .font(.callout .bold())
                        .foregroundColor(.black)
                }
                .padding(16)
                .background(Color.red.opacity(0.6))
                .clipShape(Circle())
                .shadow(radius: 3,x: 3,y: 3)
                .overlay {
                    Circle()
                        .stroke( Color.black, lineWidth: 2 )
                }
            }
        }
        .padding(.bottom)
        .padding(.trailing)
    }
}
