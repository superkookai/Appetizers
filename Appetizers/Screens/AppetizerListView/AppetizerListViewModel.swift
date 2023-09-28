//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 24/9/2566 BE.
//

import SwiftUI

@MainActor
final class AppetizerListViewModel: ObservableObject{
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    init(){
        getAppetizers()
    }
    
//    func getAppetizers(){
//        self.isLoading = true
//        
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                
//                switch result{
//                
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                    
//                case .failure(let error):
//                    switch error{
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidData
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//                    case .invalidURL:
//                        self.alertItem = AlertContext.invalidURL
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    func getAppetizers() {
            isLoading = true
            
            Task {
                do {
                    appetizers = try await NetworkManager.shared.getAppetizers()
                    isLoading = false
                } catch {
                    if let apError = error as? APError {
                        switch apError {
                            case .invalidURL:
                                alertItem = AlertContext.invalidURL
                            case .invalidResponse:
                                alertItem = AlertContext.invalidResponse
                            case .invalidData:
                                alertItem = AlertContext.invalidData
                            case .unableToComplete:
                                alertItem = AlertContext.unableToComplete
                        }
                    } else {
                        alertItem = AlertContext.invalidResponse
                    }
                    
                    isLoading = false
                }
            }
        }
}
