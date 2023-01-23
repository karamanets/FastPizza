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
                .foregroundColor(.black)
                .font(.title3.bold())
                .padding()
                .background(Color("Color1").opacity(0.5))
                .cornerRadius(30)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image("background"))
                .ignoresSafeArea()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
