//
//  DetailCategoryTableViewCell.swift
//  Challenge_Diego
//
//  Created by Diego Quimbo on 2/9/17.
//  Copyright © 2017 Diego Quimbo. All rights reserved.
//

import UIKit

class DetailCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Public Functions
    
    func loadElementsInCell(_application: Application) {
        
       self.categoryLabel.text = _application.category
    }

}
