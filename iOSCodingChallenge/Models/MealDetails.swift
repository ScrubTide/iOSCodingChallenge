//
//  DetailedMeal.swift
//  iOSCodingChallenge
//
//  Created by S on 8/16/24.
//

import Foundation


struct MealDetails: Decodable {
    
    //Custom Coding Keys
    private enum CodingKeys: String, CodingKey {
        
        case id = "idMeal"
        case instructions = "strInstructions"
        
    }
    
    //Dynamic coding keys to decode multiple repetitive keys (strIngredient and strMeasure)
    private struct DynamicCodingKeys: CodingKey {

        var stringValue: String
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int?

        init?(intValue: Int) {
            return nil
        }
    }
    
    
    //Custom decoder to decode id, instructions, and two arrays from both Dynamic and Custom keys.
    init(from decoder: Decoder) throws {
        
        //Decode using CodingKeys to get both id and instructions keys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        //Temporary array to store ingredient and measure values
        var tempIngredientArray = [String]()
        var tempMeasureArray = [String]()
            
        //Decoding using CodingKeys
        id = try container.decode(String.self, forKey: .id)
        instructions = try container.decode(String.self, forKey: .instructions)

        //Dynamic container to decode the dynamic repetitive keys (strIngredient and strMeasure)
        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)
      
        //Sort Dynamic container so that the results are always the same/predictable
        let sortedKeys = dynamicContainer.allKeys.sorted(by: {$0.stringValue < $1.stringValue})
        
        
        //Iterates through the sortedKeys to find strIngredient and strMeasure and append them to their respective arrays if they are not whitespace
        for key in sortedKeys {
            
            if key.stringValue.starts(with: "strIngredient") {
                
                //Ensure ingredient value provided is not just whitespace
                if let value = try? dynamicContainer.decode(String.self, forKey: key), value != "" {
                    tempIngredientArray.append(value)
                }
            } 
            
            if key.stringValue.starts(with: "strMeasure") {
                
                //Ensure measure value provided is not just whitespace
                if let value = try? dynamicContainer.decode(String.self, forKey: key), value.filter({ !$0.isWhitespace }) != "" {
                    tempMeasureArray.append(value)
                }
            }
        }
        
        //Assigns the tempArrays to their respective fields
        self.ingredients = tempIngredientArray
        self.measurements = tempMeasureArray
    }
    
    var id: String
    var instructions: String
    var ingredients: [String]
    var measurements: [String]

}
