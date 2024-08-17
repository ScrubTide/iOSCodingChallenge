//
//  Ingredient:MeasurementCellView.swift
//  iOSCodingChallenge
//
//  Created by S on 8/16/24.
//

import SwiftUI

struct IngredientMeasurementCellView: View {
    
    let ingredient: String
    let measurement: String
    
    var body: some View {
        
        VStack {
            HStack {
                
                Text(ingredient)
                    .padding(.leading, 10)
                Spacer()
                
                Text(measurement)
                    .padding(.trailing, 10)
            }
        }
        Divider()
            .overlay(.secondary)
    }
}

#Preview {
    IngredientMeasurementCellView(ingredient: "Eggs", measurement: "2")
}
