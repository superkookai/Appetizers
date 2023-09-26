//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 26/9/2566 BE.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .scaledToFit()
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40){
                    
                    NutritionInfoView(title: "Calories", value: appetizer.calories)
                    
                    NutritionInfoView(title: "Carbs", value: appetizer.carbs)
                    
                    NutritionInfoView(title: "Protein", value: appetizer.protein)
                    
                }
                
            }
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            })
            .padding(.bottom,30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                isShowingDetail = false
            }, label: {
                XDismissButton()
            })
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
}

struct NutritionInfoView: View{
    let title: String
    let value: Int
    
    var body: some View{
        VStack(spacing: 5){
            Text(title)
                .font(.caption)
                .bold()
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
