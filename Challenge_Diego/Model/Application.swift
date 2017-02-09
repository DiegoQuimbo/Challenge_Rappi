//
//  Application.swift
//  Challenge_Diego
//
//  Created by Diego Quimbo on 2/7/17.
//  Copyright © 2017 Diego Quimbo. All rights reserved.
//

import UIKit
import SwiftyJSON

class Application: NSObject {
    
    var name = ""
    var iconURL = ""
    var category = ""
    var company = ""
    var summary = ""
    
    
    
    override init(){
        name = ""
        iconURL = ""
        category = ""
        company = ""
        summary = ""
        
    }
    
    init(jsonOBject: JSON) {
        
        name = ""
        iconURL = ""
        category = ""
        company = ""
        summary = ""
                
        if let name = jsonOBject["im:name"]["label"].string {
            self.name = name
        }
        
        
        if let imagesIconsArr:[JSON] = jsonOBject["im:image"].array {
            if let iconURL = imagesIconsArr[2]["label"].string {
                self.iconURL = iconURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            }
        }
        
        if let category = jsonOBject["category"]["attributes"]["term"].string {
            self.category = category
        }
        
        if let company = jsonOBject["title"]["label"].string {
            self.company = company
        }
        
        if let summary = jsonOBject["summary"]["label"].string {
            self.summary = summary
        }

    }

}
