//
//  APButton.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 26/9/2566 BE.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "$9.99 - Add to Order")
}
