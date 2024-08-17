//
//  MealResponse.swift
//  iOSCodingChallenge
//
//  Created by S on 8/16/24.
//

import Foundation

//Wrapper for Meal response from server
struct MealResponse: Codable {
    var meals: [Meal]
}
