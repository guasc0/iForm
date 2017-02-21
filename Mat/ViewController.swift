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
    var nono: [Any] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    //setBordersAndRadius()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func search(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: self)
        nono = searchQuery(searchField: searchText.text!)
        
    }
    /*func setBordersAndRadius(){
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        //searchText.layer.borderWidth = 1.5
        //searchText.layer.cornerRadius = 3
       
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let VC = segue.destination as! TableViewController
        VC.VC2 = [nono]
        
        
    }
   

    
}

