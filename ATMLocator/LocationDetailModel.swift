//
//  LocationDetailModel.swift
//  ATMLocator
//
//  Created by neelam_v on 04/10/16.
//  Copyright © 2016 neelam_v. All rights reserved.
//

import Foundation

class LocationDetail : NSObject {
    
    var state : String?
    var locType : String?
    var address : String?
    var city : String?
    var zip : String?
    var name : String?
    var lat : String?
    var lng : String?
    var bank : String?
    var type : String?
    var access : String?
    var lobbyHrs : [String]?
    var driveUpHrs : [String]?
    var atms : Int?
    var services : [String]?
    var phone : String?
    var distance : Double?
    
    init(state:String,locType: String,address:String,city: String,zip:String,name:String,lat:String,lng:String, bank: String, type: String, atms: Int, services : [String], phone : String , distance : Double, access : String , driveUpHrs : [String] , lobbyHrs : [String])
    {
        self.state = state
        self.locType = locType
        self.address = address
        self.city = city
        self.zip = zip
        self.name = name
        self.lat = lat
        self.lng = lng
        self.bank = bank
        self.type = type
        self.atms = atms
        self.services = services
        self.phone = phone
        self.distance = distance
        self.access = access
        self.lobbyHrs = lobbyHrs
        self.driveUpHrs = driveUpHrs
    }
    
    override init(){
    
    // Mandatory
    self.state = ""
    self.locType = ""
    self.address = ""
    self.city = ""
    self.zip = ""
    self.name = ""
    self.lat = ""
    self.lng = ""
    self.bank = ""
    self.type = ""
    self.atms = 0
    self.services = []
    self.phone = ""
    self.distance = 0.0
    self.access = ""
    self.lobbyHrs = [String]()
    self.driveUpHrs = [String]()
    
    }
    
    static func getModelFromInputDictionary(inputDict:NSMutableDictionary) -> LocationDetail {
    
    let model = LocationDetail()
    model.state = inputDict.valueForKey(JPMCConstants.locationDetail.state) as? String
    model.locType = inputDict.valueForKey(JPMCConstants.locationDetail.locType) as? String
    model.address = inputDict.valueForKey(JPMCConstants.locationDetail.address) as? String
    model.city = inputDict.valueForKey(JPMCConstants.locationDetail.city) as? String
    model.zip = inputDict.valueForKey(JPMCConstants.locationDetail.zip) as? String
    model.name = inputDict.valueForKey(JPMCConstants.locationDetail.name) as? String
        
    model.lat = inputDict.valueForKey(JPMCConstants.locationDetail.lat) as? String
    model.lng = inputDict.valueForKey(JPMCConstants.locationDetail.lng) as? String
        
    model.bank = inputDict.valueForKey(JPMCConstants.locationDetail.bank) as? String
    model.type = inputDict.valueForKey(JPMCConstants.locationDetail.type) as? String
    model.phone = inputDict.valueForKey(JPMCConstants.locationDetail.phone) as? String
    model.atms = inputDict.valueForKey(JPMCConstants.locationDetail.atms) as? Int
    model.services = inputDict.valueForKey(JPMCConstants.locationDetail.services) as? Array<String>
    model.distance = inputDict.valueForKey(JPMCConstants.locationDetail.distance) as? Double
    model.access = inputDict.valueForKey(JPMCConstants.locationDetail.access) as? String
    model.lobbyHrs = inputDict.valueForKey(JPMCConstants.locationDetail.lobbyHrs) as? Array<String>
    model.driveUpHrs = inputDict.valueForKey(JPMCConstants.locationDetail.driveUpHrs) as? Array<String>

    return model

    }
}