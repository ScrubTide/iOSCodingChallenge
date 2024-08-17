//
//  MealService.swift
//  iOSCodingChallenge
//
//  Created by S on 8/16/24.
//

import Foundation

class MealService {
    
    public static let shared = MealService()
    
    //base url provided for this challenge
    let BASE_URL = "https://themealdb.com/api/json/v1/1"
    
    
    //Fetches meals by using the route "filter.php" and with a provided query
    func fetchFilteredMeals (query: String) async throws -> [Meal] {
    
        guard var url = URL(string: BASE_URL) else {
            throw MealServiceError.invalidURL
        }
              
        //Add the filter route to the base url
        url.append(path: "filter.php")
        
        //Add query paramter c with value Dessert to the url
        let filter = URLQueryItem(name: "c", value: query)
        url.append(queryItems: [filter])
        
        do {
            
            //Fetches data/response from the created url
            let (data, response) = try await URLSession.shared.data(from: url)
            
            //Convert response to HTTPURLResponse
            guard let httpResponse = response as? HTTPURLResponse else {
                throw MealServiceError.responseDecodingError
            }
            
            //Check if status code is 200 (Ok), otherwise throw error with the responded status code
            guard httpResponse.statusCode == 200 else {
                
                throw MealServiceError.invalidResponse(status: httpResponse.statusCode)
            }
            
            //Decode received data as a MealResponse
            let decodedMealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
            
            //Return the nested meals value
            return decodedMealResponse.meals
        }
        
        catch {
            throw MealServiceError.requestFailed(error)
        }
    }
    
    //Fetches the details (id, instructions, ingredients, and measurements) of a meal provided the id of a meal
    func fetchMealDetails (id: String) async throws -> [MealDetails] {
        
        guard var url = URL(string: BASE_URL) else {
            throw MealServiceError.invalidURL
        }
              
        //Add the lookup route to the base url
        url.append(path: "lookup.php")
        
        //Add query paramter i with the meal's id value to the url
        let filter = URLQueryItem(name: "i", value: id)
        url.append(queryItems: [filter])
 
        do {
            
            //Fetches data/response from the created url
            let (data, response) = try await URLSession.shared.data(from: url)
            
            //Convert response to HTTPURLResponse
            guard let httpResponse = response as? HTTPURLResponse else {
                throw MealServiceError.responseDecodingError
            }
            
            //Check if status code is 200 (Ok), otherwise throw error with the responded status code
            guard httpResponse.statusCode == 200 else {
                
                throw MealServiceError.invalidResponse(status: httpResponse.statusCode)
            }
            
            //Decode received data as a MealResponse
            let decodedMealResponse = try JSONDecoder().decode(MealDetailsResponse.self, from: data)

            //Return the nested meals value
            return decodedMealResponse.meals
        }
        catch {
            throw MealServiceError.requestFailed(error)
        }
    }
}
