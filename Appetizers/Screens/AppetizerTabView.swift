//
//  ContentView.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 23/9/2566 BE.
//

import SwiftUI

struct AppetizerTabView: View {
    
//    @State private var selectedTab = 0
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        TabView(selection: $order.selectedTab) {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
                .tag(1)
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
                .tag(2)
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTabView()
        .environmentObject(Order())
}
