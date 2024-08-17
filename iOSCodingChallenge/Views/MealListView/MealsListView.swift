//
//  ContentView.swift
//  iOSCodingChallenge
//
//  Created by S on 8/16/24.
//

import SwiftUI

struct MealsListView: View {
    
    @StateObject var mealListViewModel = MealsListViewModel()
    
    var body: some View {
       
        NavigationStack {
            
            List(mealListViewModel.meals) { meal in
                
               MealCellView(meal: meal)
            }
            .navigationTitle("Desserts")
            .navigationDestination(for: Meal.self) { meal in
                
                DetailedMealView(meal: meal)
            }
        }
        .task {
            
            //Fetch sorted desserts on launch
            await mealListViewModel.getSortedDesserts()
        }
    }
}

#Preview {
    MealsListView()
}
