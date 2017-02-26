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
    var name: String = "sdgsdg"
    var info: Int?
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
        self.title = nutritionData["name"] as! String?
        setHealthyValueImg(dictionary: nutrientValues)
       
    }
    
    func setHealthyValueImg(dictionary: [String:Float]){
        
        let protein = nutrientValues["protein"]
        let fat = nutrientValues["fat"]
        //let carbs = nutrientValues["carbohydrates"]
        
        if Double(protein!) > 0.5 && Double(protein!) <= 5 && Double(fat!) < 40{
            healthyValue1.image = UIImage(named: "carrots")
        } else if Double(protein!) > 5 && Double(protein!) < 7 && Double(fat!) < 35 {
            healthyValue1.image = UIImage(named: "carrots")
            healthyValue2.image = UIImage(named: "carrots")
       
        }else if Double(protein!) > 7 && Double(protein!) < 10 && Double(fat!) < 25 {
            healthyValue1.image = UIImage(named: "carrots")
            healthyValue2.image = UIImage(named: "carrots")
            healthyValue3.image = UIImage(named: "carrots")
        
        }else if Double(protein!) > 10 && Double(protein!) < 25 && Double(fat!) < 15 {
            healthyValue1.image = UIImage(named: "carrots")
            healthyValue2.image = UIImage(named: "carrots")
            healthyValue3.image = UIImage(named: "carrots")
            healthyValue4.image = UIImage(named: "carrots")
        
        }else if Double(protein!) > 25 && Double(fat!) < 10 {
            healthyValue1.image = UIImage(named: "carrots")
            healthyValue2.image = UIImage(named: "carrots")
            healthyValue3.image = UIImage(named: "carrots")
            healthyValue4.image = UIImage(named: "carrots")
            healthyValue5.image = UIImage(named: "carrots")
        
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


