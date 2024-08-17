//
//  Meal.swift
//  iOSCodingChallenge
//
//  Created by S on 8/16/24.
//

import Foundation


struct Meal: Identifiable, Codable, Hashable {
    
    //Custom Coding Keys
    private enum CodingKeys: String, CodingKey {
        case mealName = "strMeal"
        case mealThumbnailStr = "strMealThumb"
        case id = "idMeal"
    }
    
    var mealName: String
    var mealThumbnailStr: String
    var id: String
}

