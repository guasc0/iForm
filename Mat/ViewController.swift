//
//  ViewController.swift
//  Mat
//
//  Created by Gualberto Scolari on 2017-02-16.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var button: UIButton!
    var nono: [[String: Any]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    //setBordersAndRadius()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func search(_ sender: Any) {
                searchQuery(searchField: searchText.text!, returnJson: gotArray)
        
        
    }
    
    func gotArray(array: [[String: Any]]){
     nono = array
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "next", sender: self)
        }
        

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let VC = segue.destination as! TableViewController
        VC.VC2 = nono
        
        
    }
   

    
}

