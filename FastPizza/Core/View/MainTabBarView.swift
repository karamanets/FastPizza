//
//  MainTabBar.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct MainTabBarView: View {
    
    var viewModel: MainTabBarViewModel
    
    var body: some View {
        
        TabView {
            
            CatalogView()
                .tabItem {
                    Image(systemName: "menucard.fill")
                    Text("Catalog")
                }
                .toolbarBackground(.hidden, for: .tabBar)
            
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }
                .toolbarBackground(.hidden, for: .tabBar)
            
            ProfileView( vm: ProfileViewModel(profile: Examples.shared.dataUser))
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
            .toolbarBackground(.hidden, for: .tabBar)
        }
    }
}
//                     🔱
struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}



