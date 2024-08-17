//
//  MealCellView.swift
//  iOSCodingChallenge
//
//  Created by S on 8/16/24.
//

import SwiftUI

struct MealCellView: View {
    
    //Passed meal object through a ForEach from MealsListView
    let meal: Meal
    
    var body: some View {
        
        NavigationLink(value: meal) {
            
            HStack {
                
                AsyncImage(url: URL(string: meal.mealThumbnailStr)) { image in
                    image.image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    
                }
                .frame(width: 50, height: 50)
                
                Text(meal.mealName)
            }
        }
    }
}

#Preview {
    MealCellView(meal: Meal(mealName: "Apam balik", mealThumbnailStr: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", id: "53049"))
}
