//
//  File.swift
//  Mat
//
//  Created by Gualberto Scolari on 2017-02-20.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

import Foundation

func searchQuery(searchField: String) -> [Any] {
    
    //let v = ViewController()
    var parsedJson: [Any] = []
    
    
    let urlString = "http://www.matapi.se/foodstuff?query=\(searchField)&format=json&pretty=1"
    if let safeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
        let url = URL(string: safeUrlString){
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let actualData = data {
                
                let jsonOptions = JSONSerialization.ReadingOptions()
                do{
                    
                    if let foods = try JSONSerialization.jsonObject(with: actualData, options: jsonOptions) as? [[String:Any]]{
                        print(foods)
                        //print(parsed)
                        
                        parsedJson.append(foods)
                        DispatchQueue.main.async{
                            //info.append(foods)
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
    return parsedJson
}
