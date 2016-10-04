//
//  JPMCConstants.swift
//  ATMLocator
//
//  Created by neelam_v on 03/10/16.
//  Copyright © 2016 neelam_v. All rights reserved.
//

import Foundation

struct JPMCConstants {
    
    struct AppBasic {
        static let baseURL = "https://m.chase.com/PSRWeb/location/list.action"
    }
    
    struct MapConstants {
        static let ApiKey = "GoogleApiKey"

    }
    
    struct locationDetail {
        
        static let emptyString = ""
        static let state = "state"
        static let locType = "locType"
        static let address = "address"
        static let city = "city"
        static let zip = "zip"
        static let lat = "lat"
        static let lng = "lng"
        static let bank = "bank"
        static let name = "name"
        static let type = "type"
        static let phone = "phone"
        static let atms = "atms"
        static let services = "services"
        static let distance = "distance"
        static let access = "access"
        static let lobbyHrs = "lobbyHrs"
        static let driveUpHrs = "driveUpHrs"

    }
}