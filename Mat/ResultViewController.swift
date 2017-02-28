//
//  ResultViewController.swift
//  Mat
//
//  Created by Gualberto Scolari on 2017-02-18.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultTitle: UINavigationItem!
    @IBOutlet weak var salt: UILabel!
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var sugar: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var carbohydrates: UILabel!
    
    @IBOutlet weak var healthyValue1: UIImageView!
    @IBOutlet weak var healthyValue2: UIImageView!
    @IBOutlet weak var healthyValue3: UIImageView!
    @IBOutlet weak var healthyValue4: UIImageView!
    @IBOutlet weak var healthyValue5: UIImageView!
    @IBOutlet weak var dontEat: UIImageView!
    
    
    var nutritionData: [String: Any] = [:]
    var nutrientValues: [String: Float] = [:]
    var pressedCellNr: Int!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchQueryForNutrition(number: Int(pressedCellNr), gotNutritionData: recievedData)
        

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
            salt.text = "\(saltValue) g"
        }
        if let proteinValue = nutrientValues["protein"] {
            protein.text = "\(proteinValue) g"
        }
        if let saccharoseValue = nutrientValues["saccharose"] {
            sugar.text = "\(saccharoseValue) g"
        }
        if let fatValue = nutrientValues["fat"] {
            fat.text = "\(fatValue) g"
        }
        if let carbohydratesValue = nutrientValues["carbohydrates"] {
            carbohydrates.text = "\(carbohydratesValue) g"
        }
        
        resultTitle.title = nutritionData["name"] as! String?

        setHealthValueImg(dictionary: nutrientValues)
       
    }
    
    func setHealthValueImg(dictionary: [String:Float]){
        
        let fat = nutrientValues["fat"]
        let carbs = nutrientValues["carbohydrates"]
        let healthLevel = Double(carbs!) + Double(fat!)
        
        if healthLevel > 50 && healthLevel < 70 {
            healthyValue1.image = UIImage(named: "carrot2")
        } else if healthLevel > 40 && healthLevel <= 50  {
            healthyValue1.image = UIImage(named: "carrot2")
            healthyValue2.image = UIImage(named: "carrot2")
            
        }else if healthLevel > 30 && healthLevel <= 40 {
            healthyValue1.image = UIImage(named: "carrot2")
            healthyValue2.image = UIImage(named: "carrot2")
            healthyValue3.image = UIImage(named: "carrot2")
            
        }else if healthLevel > 15 && healthLevel <= 30{
            healthyValue1.image = UIImage(named: "carrot2")
            healthyValue2.image = UIImage(named: "carrot2")
            healthyValue3.image = UIImage(named: "carrot2")
            healthyValue4.image = UIImage(named: "carrot2")
            
        }else if healthLevel <= 15 {
            healthyValue1.image = UIImage(named: "carrot2")
            healthyValue2.image = UIImage(named: "carrot2")
            healthyValue3.image = UIImage(named: "carrot2")
            healthyValue4.image = UIImage(named: "carrot2")
            healthyValue5.image = UIImage(named: "carrot2")
            
        }else{
            dontEat.image = UIImage(named: "warning")
        }
    
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


