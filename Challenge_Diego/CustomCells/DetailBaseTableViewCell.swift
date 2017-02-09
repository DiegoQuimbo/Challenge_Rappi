//
//  DetailBaseTableViewCell.swift
//  Challenge_Diego
//
//  Created by Diego Quimbo on 2/8/17.
//  Copyright © 2017 Diego Quimbo. All rights reserved.
//

import UIKit

class DetailBaseTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Round Profile Image
        self.iconImageView.layer.cornerRadius = 15
        self.iconImageView.clipsToBounds = true
        self.iconImageView.layer.borderColor =  UIColor(red: 179.0/255, green: 179.0/255, blue: 179.0/255, alpha: 1.0).cgColor
        self.iconImageView.layer.borderWidth = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Public Functions
    
    func loadElementsInCell(_application: Application) {
        
        let imageUrl = NSURL(string: _application.iconURL)
        self.iconImageView.af_setImage(withURL: imageUrl as! URL)
        
        self.nameLabel.text = _application.name
        self.companyLabel.text = _application.company
    }

}
