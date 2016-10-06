//
//  ATMUtility.swift
//  ATMLocator
//
//  Created by neelam_v on 05/10/16.
//  Copyright © 2016 neelam_v. All rights reserved.
//

import Foundation

class ATMUtility: NSObject {

    
    //MARK: Values from App Configuration
    class func getAppConfigValueFor(key key: String) -> AnyObject! {
        // Get Main Bundle
        let frameworkBundle = NSBundle.mainBundle()
        // Get App Config Plist from Bundle
        if let pathStr = frameworkBundle.pathForResource("App Config", ofType: "plist") {
            let headerDictionary = NSDictionary(contentsOfFile: pathStr)
            return headerDictionary!.valueForKey(key)
        }
        return nil
    }

}