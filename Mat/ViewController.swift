//
//  ViewController.swift
//  Mat
//
//  Created by Gualberto Scolari on 2017-02-16.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var eggPlant: UIImageView!
    @IBOutlet weak var carrot: UIImageView!
    @IBOutlet weak var chili: UIImageView!
    @IBOutlet weak var tomato: UIImageView!
    @IBOutlet weak var imageConstraint: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    var VcArray: [[String: Any]] = []
    var animationPerformed = false
    var dynamicAnimator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    var collision : UICollisionBehavior!
    var push : UIPushBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGravityImages()
        dynamicAnimations()
        imageConstraint.constant -= view.bounds.width
        setButton()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         imageAnimation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func search(_ sender: Any) {
                searchQuery(searchField: searchText.text!, returnJson: gotArray)
        
        
    }
    
    func gotArray(array: [[String: Any]]){
     VcArray = array
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "next", sender: self)
        }
        

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tableView = segue.destination as! TableViewController
        tableView.tableViewArray = VcArray
        
        
    }
    
    func setButton(){
        button.layer.cornerRadius = 8
        
    }
    // Maybe a redundant function, can be sett in the storyboard to
    func setGravityImages(){
        eggPlant.image = UIImage(named: "Eggplant-icon")
        carrot.image = UIImage(named: "carrots")
        chili.image = UIImage(named: "chilli")
        tomato.image = UIImage(named: "tomato")
    }
    
    func dynamicAnimations(){
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [chili, tomato, eggPlant, carrot])
        dynamicAnimator.addBehavior(gravity)
        collision = UICollisionBehavior(items: [chili, tomato, eggPlant, carrot])
        collision.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collision)
        push = UIPushBehavior(items: [eggPlant, carrot, tomato, chili], mode: .instantaneous)
        push.pushDirection = CGVector(dx: 56, dy: 9)
        dynamicAnimator.addBehavior(push)
        
        // x:21 y:9
        // x:5 y:30
        
    }
    
    func imageAnimation(){
        if !animationPerformed{
            UIView.animate(withDuration: 0.8, delay: 1.0, options: .curveLinear, animations: {
                self.imageConstraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            animationPerformed = true
            
        }
    }

}

