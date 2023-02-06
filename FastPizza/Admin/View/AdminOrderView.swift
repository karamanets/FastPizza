//
//  AdminOrderView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 01.02.2023.
//

import SwiftUI

struct AdminOrderView: View {
    
    @StateObject var viewModel: AdminOrderViewModel
    @ObservedObject var vm: AdminOrdersViewModel
    @Environment(\.dismiss) var goBack
    
    var statuses: [String] {
        var status = [String]()
        for item in OrderStatus.allCases {
            status.append(item.rawValue)
        }
        return status
    }
    
    var body: some View {
            VStack {
                Spacer(minLength: 50)
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
                
                VStack {
                    Picker("", selection: $viewModel.order.status) {
                        ForEach(statuses, id: \.self) { item in
                            Text(item)
                        }
                    }
                    .onChange(of: viewModel.order.status) { item in
                        DatabaseService.shared.setOrder(order: viewModel.order) { result in
                            switch result {
                            case .success(let order):
                                print(order.status)
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
                .frame(maxWidth: 200, maxHeight: 30)
                .background(Color("Color1").opacity(0.5))
                .cornerRadius(30)
                .padding(8)
                
                VStack {
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
                
                HStack {
                    Button {
                        goBack()
                        DispatchQueue.global().async {
                            vm.getOrder()
                        }
                    } label: {
                        Text("Go back")
                            .foregroundColor(.black)
                            .font(.system(size: 18) .bold())
                            .padding(.horizontal)
                            .padding()
                            .background(Color.red.opacity(0.9))
                            .cornerRadius(14)
                            .shadow(radius: 3,x: 3,y: 3)
                    }
                }
                .padding(.bottom)
        }
        .background(Image("background"))
        .ignoresSafeArea()
    }
}

struct AdminOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrderView(viewModel: AdminOrderViewModel(order: Examples.shared.order), vm: AdminOrdersViewModel())
    }
}
