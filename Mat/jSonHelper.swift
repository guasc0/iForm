//
//  File.swift
//  Mat
//
//  Created by Gualberto Scolari on 2017-02-20.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

import Foundation

func searchQuery(searchField: String, returnJson: @escaping ([[String: Any]]) -> Void) {
    
    let urlString = "http://www.matapi.se/foodstuff?query=\(searchField)"
    if let safeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
        let url = URL(string: safeUrlString){
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let actualData = data {
                
                let jsonOptions = JSONSerialization.ReadingOptions()
                do{
                    
                    if let foods = try JSONSerialization.jsonObject(with: actualData, options: jsonOptions) as? [[String:Any]]{
                       
                        
                        DispatchQueue.main.async{
                            returnJson(foods)
                        }
                        
                        } else {
                        NSLog("Failed to cast jSon")
                        
                    }
                }
                
                catch let ParseError {
                    NSLog("Failed to parse json: \(ParseError)")
                }
                
            } else {
                
                NSLog("No data recieved")
            }
            
            
        }
        task.resume()
    
    } else {
        NSLog("Failed to create url!")
    
    }
    
}

func searchQueryForNutrition(number : Int, gotNutritionData : @escaping ([String:Any]) -> Void) {
    
    let urlString = "http://matapi.se/foodstuff/\(number)"
    if let safeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: safeUrlString) {
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request)
        { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let actualData = data {
                let jsonOptions = JSONSerialization.ReadingOptions()
                do {
                    
                    if let nutritions = try JSONSerialization.jsonObject(with: actualData, options: jsonOptions) as? [String:Any] {
                        
                        DispatchQueue.main.async {
                            
                            gotNutritionData(nutritions)
                            print(nutritions)
                        }
                        
                    }else {
                        NSLog("Failed to cast form json")
                    }
                    
                }
                catch let parseError {
                    NSLog("Failed to parse json: \(parseError)")
                }
            }else {
                NSLog("No data recieved :´(")
            }
        }
        task.resume()
    } else {
        NSLog("Failed to create url :(")
    }
}




