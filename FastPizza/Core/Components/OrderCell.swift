//
//  OrderCell.swift
//  FastPizza
//
//  Created by Alex Karamanets on 30.01.2023.
//

import SwiftUI

struct OrderCell: View {
    
    var order: Order
    
    var formatter: DateFormatter.Style
    
    var body: some View {
        GeometryReader { geo in
            HStack (alignment: .center) {
                Text("\(order.date.asShortDateString(type: formatter))")
                    .font(.callout .bold())
                    .frame(width: geo.size.width / 3, alignment: .leading)
                
                Text("\(order.cost)")
                    .foregroundColor(.black)
                    .font(.title2 .bold())
                    .frame(width: geo.size.width / 4, alignment: .center)
                
                Text("\(order.status)")
                    .foregroundColor(order.status == "In process" ? .red : .green)
                    .font(.headline .bold())
                    .frame(width: geo.size.width / 3, alignment: .trailing)
            }
            .frame(height: geo.size.height)
        }
    }
}

//                     🔱
struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell(order: Order(userID: "", date: Date(), status: "Delivering"),
                  formatter: .medium)
    }
}

