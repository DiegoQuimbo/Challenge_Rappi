//
//  ConnectionManager.swift
//  SaludMovil
//
//  Created by Diego Quimbo on 2/08/17.
//  Copyright © 2017 Diego Quimbo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ConnectionManager: NSObject {
    
    /* SINGLETON */
    static let sharedInstance: ConnectionManager = {
        let instance = ConnectionManager()
        return instance
    }()
    
    static let GetApplicationsURL = "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json"
    
    
    
//    /// Call WS and get Friends from API
    class func getApplications(_ limit: Int, _ CallbackParameter: @escaping (_ error : NSError?, _ message : String?, _ objects: [Application]) -> ()){
        
        // Display an Activity Indicator in the status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        var applications: [Application] = []

        
        Alamofire.request(GetApplicationsURL).responseJSON { response in
            switch response.result {
            case .success(let data):
                
                // USE SwiftyJSON to parse data
                let json = JSON(data)
                
                // Get Objects
                let jsonArr:[JSON] = json["feed"]["entry"].array!

                for aplicationJSON in jsonArr {

                    // Parse Object
                    let application = Application(jsonOBject: aplicationJSON)
                    applications.append(application)

                }
                
                // Dismiss an Activity Indicator in the status bar
                UIApplication.shared.isNetworkActivityIndicatorVisible = false

                
                CallbackParameter(nil, "Success", applications)
                
                
            case .failure(let error):
                print("Request failed with error: \(error)")
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                CallbackParameter(error as NSError?, "Error", applications)
            }
        }
        
    }

}
