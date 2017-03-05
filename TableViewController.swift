//
//  TableViewController.swift
//  Mat
//
//  Created by Gualberto Scolari on 2017-02-16.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

import UIKit



class TableViewController: UITableViewController {
    
    var tableViewArray: [[String: Any]] = [[:]]
    var energyArray: [String:Any] = [:]
    @IBOutlet weak var resultCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTablieView()
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
    
        return tableViewArray.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCustomTableViewCell
        
            if let name = tableViewArray[indexPath.row]["name"] as? String{
                cell.nameLabel.text = name
            }
            
            if let number = tableViewArray[indexPath.row]["number"] as? String{
                cell.nrLabel.text = number
            }
            
            if let nr = tableViewArray[indexPath.row]["number"]{
                
                cell.numberOfRow = nr as! Float
                
            }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if let segueSender = segue.destination as? ResultViewController,
                let row = tableView.indexPathForSelectedRow{
                if let cell = tableView.cellForRow(at: row) as? MyCustomTableViewCell{
                    segueSender.pressedCellNr = Int(cell.numberOfRow)
                    
                }
            }
    }
    
    func animateTablieView(){
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 0.5, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 5.0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
                }, completion: nil)
            delayCounter += 1
            
        }
    
    }
    
}
