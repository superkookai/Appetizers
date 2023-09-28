//
//  Order.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 28/9/2566 BE.
//

import SwiftUI

final class Order: ObservableObject{
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double{
        items.reduce(0){ $0 + $1.price}
        
//        var total = 0.0
//        for item in items{
//            total += item.price
//        }
//        return total
    }
    
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
}
