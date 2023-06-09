//
//  OrderCell.swift
//  FastPizza
//
//  Created by Alex Karamanets on 30.01.2023.
//

import SwiftUI

struct OrderCell: View {
    
    var order: Order
    
    var body: some View {
        GeometryReader { geo in
            HStack (alignment: .center) {
                Text("\(order.date.asShortDateString())")
                    .font(.headline)
                    .frame(width: geo.size.width / 3)
                
                Text("\(order.cost)")
                    .foregroundColor(.black)
                    .font(.title2 .bold())
                    .frame(width: geo.size.width / 4)
                
                Text("\(order.status)")
                    .foregroundColor(.green)
                    .font(.title2 .bold())
                    .frame(width: geo.size.width / 3)
            }
            .frame(height: geo.size.height)
        }
    }
}

//                     🔱
struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell(order: Order(userID: "", date: Date(), status: "Delivering"))
    }
}

