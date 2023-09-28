//
//  EmptyState.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 28/9/2566 BE.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "Default Message")
}
