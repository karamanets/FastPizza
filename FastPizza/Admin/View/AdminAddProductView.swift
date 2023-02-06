//
//  AdminAddProductView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 06.02.2023.
//

import SwiftUI
import PhotosUI

struct AdminAddProductView: View {
    
    @StateObject var viewModel = AdminAddProductViewModel()
    
    @State private var name        = String()
    @State private var price       : Int? = nil
    @State private var description = String()
    @State private var alert       = false
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                if viewModel.image != nil {
                    
                    if let image = viewModel.image {
                        image
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .frame(maxWidth: .infinity, minHeight: 250, maxHeight: 250)
                            .shadow(radius: 3,x: 3,y: 3)
                    } else {
                        Text("Error type")
                    }
                    
                } else {
                    Image(Examples.shared.product.imageUrl)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .frame(maxWidth: .infinity, maxHeight: 250)
                        .shadow(radius: 3,x: 3,y: 3)
                }
                
                PhotosPicker(selection: $viewModel.imageSelection, label: {
                    Text("Add Foto")
                        .foregroundColor(.black)
                        .font(.title2 .bold())
                        .padding(.all, 10)
                        .padding(.horizontal, 20)
                        .background(Color.orange)
                        .cornerRadius(20)
                        .opacity(0.8)
                        .shadow(color: .black, radius: 3, x: 2, y: 3)
                })
                Spacer()
                
                VStack {
                    TextField("Name", text: $name)
                        .textContentType(.name)
                        .foregroundColor(.black)
                        .font(.title2)
                        .padding(.all,14)
                        .padding(.horizontal, 30)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(30)
                        .tint(.red)
                    
                    TextField("Price", value: $price, format: .number)
                        .keyboardType(.numberPad)
                        .foregroundColor(.black)
                        .font(.title2)
                        .padding(.all,14)
                        .padding(.horizontal, 30)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(30)
                        .tint(.red)
                    
                    TextField("Description", text: $description)
                        .textContentType(.name)
                        .foregroundColor(.black)
                        .font(.title2)
                        .padding(.all,14)
                        .padding(.horizontal, 30)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(30)
                        .tint(.red)
                }
                .padding(.all, 20)
                .padding(.vertical, 20)
                .background(Color.white.opacity(0.2))
                .cornerRadius(30)
                .padding(.all, 20)
                
                Spacer(minLength: 70)
                VStack {
                    Button {
                        self.alert.toggle()
                    } label: {
                        Text("Add Position to Server")
                            .foregroundColor(.black)
                            .font(.footnote .monospaced() .bold())
                            .padding(.horizontal)
                            .padding()
                            .background(Color.green.opacity(0.9))
                            .cornerRadius(14)
                            .shadow(radius: 3,x: 3,y: 3)
                    }
                }
            }
            .navigationTitle("Add product")
            .toolbarTitleMenu(content: {
                Text(Examples.shared.descriptionAdd)
            })
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("background"))
        }
        .alert("Do you wont to add position to Server ? 🦉", isPresented: $alert) {
            Button("Yes", role: .destructive) {
                self.name = ""
                self.price = nil
                self.description = ""
                viewModel.image = nil
            }
        }
    }
}

struct AdminAddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AdminAddProductView()
    }
}
