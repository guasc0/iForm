//
//  ResultViewController.swift
//  Mat
//
//  Created by Gualberto Scolari on 2017-02-18.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var result1: UITextField!
    @IBOutlet weak var result2: UITextField!
    @IBOutlet weak var result3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFields()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTextFields(){
        result1.layer.borderWidth = 2
        result1.layer.cornerRadius = 4
        result2.layer.borderWidth = 2
        result2.layer.cornerRadius = 4
        result3.layer.borderWidth = 2
        result3.layer.cornerRadius = 4
    
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
