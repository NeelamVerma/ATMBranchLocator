//
//  JPMCWebServices.swift
//  ATMLocator
//
//  Created by neelam_v on 03/10/16.
//  Copyright © 2016 neelam_v. All rights reserved.
//

// Class for JPMC Webserivces
import Foundation
import GoogleMaps

class JPMCWebServices: NSObject {
    
    
    //MARK: Common API for  Results
    static func getResults(fetchURL: String, completionHandler: (NSData?, NSError?) -> ()) {
        
        let sslURL = NSURL(string: fetchURL)
        var task : NSURLSessionTask?
            
        task = NSURLSession.sharedSession().dataTaskWithURL(sslURL!){
            data, response, error in
            
            dispatch_async(dispatch_get_main_queue()) {
                
                guard data != nil else {
                    completionHandler(nil, error)
                    return
                }
                let dataResult = data! as NSData
                completionHandler(dataResult, nil)
                
            }

        }
        
        if let resultTask = task
        {
            resultTask.resume()
        }
       
    }
        
    
    
    //MARK: Get ATM/Branch Locations
    static func getLocations(cordinates : CLLocationCoordinate2D , completionhandler:((Array<LocationDetail>?,NSError?) -> Void)) {

        var fullPath = "\(JPMCConstants.AppBasic.baseURL)?lat=\(cordinates.latitude)&lng=\(cordinates.longitude)"

        fullPath = fullPath.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!

        self.getResults(fullPath) { (data, error) in
            
            guard data != nil else {
                completionhandler(nil,error)
                return
            }
            
            do
            {
                if let cordinateData = data
                {
                    if let responseData : NSDictionary = try NSJSONSerialization.JSONObjectWithData(cordinateData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                    {
                        var locations = Array<LocationDetail>()
                        if let locs = responseData.valueForKey(JPMCConstants.locationDetail.locations) as? NSArray
                        {
                            for loc in locs
                            {
                                let dict : NSMutableDictionary = (loc as? NSMutableDictionary)!
                                let model : LocationDetail = LocationDetail.getModelFromInputDictionary(dict)
                                locations.append(model)
                            }
                        }
                        completionhandler(locations,nil)
                    }
                }
                
            }
            catch let responseDataError as NSError {
                
                completionhandler(nil,responseDataError)
            }
            
            
        }
 
    }
    
}