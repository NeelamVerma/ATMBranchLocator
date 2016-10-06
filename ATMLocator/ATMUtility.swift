//
//  ATMUtility.swift
//  ATMLocator
//
//  Created by neelam_v on 05/10/16.
//  Copyright © 2016 neelam_v. All rights reserved.
//

import Foundation

class ATMUtility: NSObject {

    var pathStr : String?

    class var sharedInstance :ATMUtility {
        struct Singleton {
            static var instance = ATMUtility()
        }
        
        return Singleton.instance
    }
    
    private override init() {
        self.pathStr = NSBundle.mainBundle().pathForResource("App Config", ofType: "plist")
    }
    
    //MARK: Values from App Configuration
     func getAppConfigValueFor(key key: String) -> AnyObject! {
        if let path = pathStr
        {
            let headerDictionary = NSDictionary(contentsOfFile: path)
            return headerDictionary!.valueForKey(key)
        }
        else
        {
            return ""
        }
    }
    


}
