//
//  OrderView.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 23/9/2566 BE.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List{
                        ForEach(order.items){ appetizer in
                            AppetizerListRow(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button(action: {
                        
                    }, label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    })
                    .padding(.bottom, 25)
                
                }
                
                if order.items.isEmpty{
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. \nPlease add your appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
        
    }
    
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
