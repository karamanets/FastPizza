//
//  ProfileView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 14.01.2023.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        NavigationStack {
            
            Text("Profile")
            
            
            
            
            
            
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(colors: [Color.brown, Color.orange],
                                           startPoint: .bottomLeading,
                                           endPoint: .topTrailing).opacity(0.7))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
