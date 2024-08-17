//
//  DetailedMealResponse.swift
//  iOSCodingChallenge
//
//  Created by S on 8/16/24.
//

import Foundation

//Wrapper for Meal Details response from server
struct MealDetailsResponse: Decodable {
    var meals: [MealDetails]
}
