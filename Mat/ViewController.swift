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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    setBordersAndRadius()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setBordersAndRadius(){
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        searchText.layer.borderWidth = 1.5
        searchText.layer.cornerRadius = 3
       
    }
}

