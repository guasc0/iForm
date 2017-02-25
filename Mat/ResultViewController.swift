//
//  ResultViewController.swift
//  Mat
//
//  Created by Gualberto Scolari on 2017-02-18.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var salt: UILabel!
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var saccharose: UILabel!
    @IBOutlet weak var fat: UILabel!
    
    var nutritionData: [String: Any] = [:]
    var nutrientValues: [String: Float] = [:]
    var name: String = "sdgsdg"
    var info: Int?
    var pressedCellNr: Int!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchQueryForNutrition(number: Int(pressedCellNr), gotNutritionData: recievedData)
        //recievedData(dictionary: nutritionData)
        //self.title = nutritionData["name"] as! String?
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func recievedData(dictionary : [String:Any]) {
        
        nutritionData = dictionary
        
        if let nV = nutritionData["nutrientValues"] as? [String:Float]{
           nutrientValues = nV
        }
        
        setValues(dictionary: nutrientValues)
    }
    
    func setValues(dictionary : [String:Float]) {
        
        if let saltValue = nutrientValues["salt"] {
            salt.text = "Salt: \(saltValue)g"
        }
        if let proteinValue = nutrientValues["protein"] {
            protein.text = "Protein: \(proteinValue)g"
        }
        if let fatValue = nutrientValues["saccharose"] {
            saccharose.text = "Socker: \(fatValue)g"
        }
        if let carbsValue = nutrientValues["fat"] {
            fat.text = "Fett: \(carbsValue)g"
        }
    }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
