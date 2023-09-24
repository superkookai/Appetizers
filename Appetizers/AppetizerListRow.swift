//
//  AppetizerListRow.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 24/9/2566 BE.
//

import SwiftUI

struct AppetizerListRow: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack{
            Image("asian-flank-steak")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListRow(appetizer: MockData.sampleAppetizer)
}
