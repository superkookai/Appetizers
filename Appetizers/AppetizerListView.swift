//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 23/9/2566 BE.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationStack {
            List(MockData.appetizers, rowContent: { appetizer in
                AppetizerListRow(appetizer: appetizer)
            })
                .navigationTitle("🍟 Appetizers")
        }
    }
}

#Preview {
    AppetizerListView()
}
