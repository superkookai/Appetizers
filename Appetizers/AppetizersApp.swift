//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 23/9/2566 BE.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
