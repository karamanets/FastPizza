//
//  AdminAddProductView.swift
//  FastPizza
//
//  Created by Alex Karamanets on 06.02.2023.
//

import SwiftUI

struct AdminAddProductView: View {
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
            }
          
            
            .navigationTitle("Add product")
            
            
            .toolbarTitleMenu(content: {
                Text(Examples.shared.descriptionAdd)
            })
            
            
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("background"))
            
           
        }
    }
}

struct AdminAddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AdminAddProductView()
    }
}
