//
//  MealCellView.swift
//  iOSCodingChallenge
//
//  Created by S on 8/16/24.
//

import SwiftUI

struct DetailedMealView: View {
    
    @StateObject var detailedMealViewModel = DetailedMealViewModel()
    
    //Passed meal object through navigation from MealsListView
    let meal: Meal
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                AsyncImage(url: URL(string: meal.mealThumbnailStr)) { image in
                    image.image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .frame(width: 200, height: 200)
                
                Text(meal.mealName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Divider()
                    .overlay(.secondary)
                
                if let mealDetails = detailedMealViewModel.mealDetails {
                    
                    Text("Instructions")
                        .font(.title)
                    Text(mealDetails.instructions)
                        .padding()
                    
                    Text("Ingredients/Measurements")
                        .font(.title)
                        .padding()
                    
                    
                    VStack {
                        ForEach(mealDetails.ingredients.indices, id: \.self) {index in
                            
                            IngredientMeasurementCellView(ingredient: mealDetails.ingredients[index], measurement: mealDetails.measurements[index])
                        }
                    }
                    .padding()
                }
                else {
                
                    ProgressView("Fetching Details")
                        .progressViewStyle(.circular)
                        .padding()
               
                }
            }
        }
        .task {
            
            //Fetches meal details by id
            await detailedMealViewModel.fetchMealDetails(for: meal.id)
        }
    }
}

#Preview {
    DetailedMealView(meal: Meal(mealName: "Apam balik", mealThumbnailStr: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", id: "53049"))
}
