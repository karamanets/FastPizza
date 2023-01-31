//
//  OrderCell.swift
//  FastPizza
//
//  Created by Alex Karamanets on 30.01.2023.
//

import SwiftUI

struct OrderCell: View {
    
    @State var order: Order
    
    var body: some View {
        
        HStack {
            Text("\(order.date)")
            
            Text("\(order.cost)")
                .foregroundColor(.black)
                .font(.title2 .bold())
                .frame(width: 90)
            
            Text("\(order.status)")
                .foregroundColor(.green)
                .font(.title2 .bold())
                .frame(width: 110)
        }
    }
}
