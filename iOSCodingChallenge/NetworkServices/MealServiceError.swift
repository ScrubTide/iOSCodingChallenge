//
//  MealServiceError.swift
//  iOSCodingChallenge
//
//  Created by S on 8/16/24.
//

import Foundation


//Custom Error enum to provide descriptive errors for MealService
enum MealServiceError: Error {
    
    case invalidURL
    case responseDecodingError
    case invalidResponse(status: Int)
    case requestFailed(Error)
    
    var description: String {
        switch(self) {
        case .invalidURL:
            return "Error occuring when BASE_URL is converted to a URL instance"
        case .invalidResponse(let status):
            return "Server responded with non-200 response code: \(status)"
        case .responseDecodingError:
            return "Error when converting reponse to HTTPURLResponse"
        case .requestFailed(let error):
            return "Failed to fetch: \(error)"
        }
    }
}
