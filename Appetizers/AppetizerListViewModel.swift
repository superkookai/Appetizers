//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 24/9/2566 BE.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject{
    
    @Published var appetizers: [Appetizer] = []
    
    init(){
        getAppetizers()
    }
    
    func getAppetizers(){
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
