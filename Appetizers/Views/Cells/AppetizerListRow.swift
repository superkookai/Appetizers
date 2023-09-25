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
//            AsyncImage(url: URL(string: appetizer.imageURL)) {
//                phase in
//                
//                if let image = phase.image {
//                    image
//                        .resizable()
//                } else if phase.error != nil {
//                    Color.red
//                } else {
//                    ProgressView()
//                }
//            }
//            .scaledToFit()
//            .frame(width: 120, height: 90)
//            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            AppetizerRemoteImage(urlString: appetizer.imageURL)
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
