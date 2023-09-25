//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 23/9/2566 BE.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.appetizers, rowContent: { appetizer in
                AppetizerListRow(appetizer: appetizer)
            })
            .navigationTitle("🍟 Appetizers")
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
