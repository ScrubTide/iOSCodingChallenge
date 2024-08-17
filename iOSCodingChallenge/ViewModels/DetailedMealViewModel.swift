//
//  MealDetailedViewModel.swift
//  iOSCodingChallenge
//
//  Created by S on 8/16/24.
//

import Foundation


class DetailedMealViewModel: ObservableObject {
    
    @Published var mealDetails: MealDetails?
    
    let mealService = MealService.shared
    
    //Fetches meal details
    @MainActor
    func fetchMealDetails(for id: String) async {
        
        do {
            
            let detailedMeal = try await mealService.fetchMealDetails(id: id)
            self.mealDetails = detailedMeal.first
        }
        catch (let thrownError as MealServiceError) {
            print("Error fetching meal details. Reason: \(thrownError.description)")
        }
        catch {
            print("Error fetching meal details. Reason: \(error)")
        }
    }
}
