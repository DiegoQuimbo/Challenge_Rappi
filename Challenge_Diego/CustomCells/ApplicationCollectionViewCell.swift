//
//  ApplicationCollectionViewCell.swift
//  Challenge_Diego
//
//  Created by Diego Quimbo on 2/9/17.
//  Copyright © 2017 Diego Quimbo. All rights reserved.
//

import UIKit

class ApplicationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Round Profile Image
        self.iconImageView.layer.cornerRadius = 15
        self.iconImageView.clipsToBounds = true
        self.iconImageView.layer.borderColor =  UIColor(red: 179.0/255, green: 179.0/255, blue: 179.0/255, alpha: 1.0).cgColor
        self.iconImageView.layer.borderWidth = 0.5
    }
    
    // Public Functions
    
    func loadElementsInCell(_application: Application, index: Int) {
        
        self.nameLabel.text = _application.name
        self.categoryLabel.text = _application.category
        
        let imageUrl = NSURL(string: _application.iconURL)
        self.iconImageView.af_setImage(withURL: imageUrl as! URL)
        
    }
    
}
