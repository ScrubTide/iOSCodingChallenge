//
//  MealListViewModel.swift
//  iOSCodingChallenge
//
//  Created by S on 8/16/24.
//

import Foundation


class MealsListViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    
    let mealService = MealService.shared
    
    //Fetches desserts and sorts them alphabetically
    @MainActor
    func getSortedDesserts() async {
        
        do {
            
            var meals = try await mealService.fetchFilteredMeals(query: "Dessert")
            meals.sort(by: {$0.mealName < $1.mealName})
            self.meals = meals
        }
        catch (let thrownError as MealServiceError) {
            print("Error fetching sorted desserts. Reason: \(thrownError.description)")
        }
        catch {
            print("Error fetching sorted desserts. Reason: \(error)")
        }
    }
}

