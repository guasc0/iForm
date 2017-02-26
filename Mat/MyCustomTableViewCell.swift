//
//  MyCustomTableViewCell.swift
//  Mat
//
//  Created by Gualberto Scolari on 2017-02-22.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nrLabel: UILabel!
    var number: Float = 0
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //nameLabel.lineBreakMode = .byWordWrapping
        //nameLabel.numberOfLines = 0
        // Configure the view for the selected state
    }

}
