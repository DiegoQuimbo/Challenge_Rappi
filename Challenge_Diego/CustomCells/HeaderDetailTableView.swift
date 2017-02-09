//
//  HeaderDetailTableView.swift
//  Challenge_Diego
//
//  Created by Diego Quimbo on 2/8/17.
//  Copyright © 2017 Diego Quimbo. All rights reserved.
//

import UIKit
import Spring

class HeaderDetailTableView: UIView {
    
    @IBOutlet var titleLabel: SpringLabel!
    
    class func instanceFromNib() -> HeaderDetailTableView {
        return UINib(nibName: "HeaderDetailTableView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HeaderDetailTableView
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }

}
