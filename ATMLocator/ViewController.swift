//
//  ViewController.swift
//  ATMLocator
//
//  Created by neelam_v on 03/10/16.
//  Copyright © 2016 neelam_v. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate ,CLLocationManagerDelegate{

    @IBOutlet weak var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    var latitude: Double!
    var longitude: Double!
    let marker = GMSMarker()
    var arrayOfATMs : Array<LocationDetail>?
    
    //MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        
        // Location Manager attributes
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        self.mapView.animateToZoom(15)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let segueIdentifier = segue.identifier
        if segueIdentifier == "showATMLocationDetail"{
            let destinationController = segue.destinationViewController as! ATMLocationDetailVC
            destinationController.locationDetailModel = sender as? LocationDetail
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Refresh The main screen to get updated near by locations
    @IBAction func refresh(sender: AnyObject) {
        mapView.clear()
        self.mapView.animateToZoom(15)
        self.locationManager.startUpdatingLocation()

    }
    
    //MARK: Location Manager Delegate
    func locationManager(manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]){

        let location:CLLocation = locations.last!
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
        
        let coordinates = CLLocationCoordinate2DMake(self.latitude, self.longitude)
        let marker = GMSMarker(position: coordinates)
        marker.icon = UIImage.init(named: "currentLoc")
        marker.map = self.mapView
        
        self.mapView.animateToLocation(coordinates)
        self.locationManager.stopUpdatingLocation()
        self.getNearByATMLocations(coordinates)
        
    }
    
    // Call for near by ATMs/Branches
    func getNearByATMLocations(coordinates : CLLocationCoordinate2D) {
        
        // Webservice call for getting near by ATMs or Branches
        JPMCWebServices.getLocations(coordinates) { (reponse, err) in
            dispatch_async(dispatch_get_main_queue()) {
                
                if let response = reponse
                {
                    for locDetails in response
                    {
                        if let lattitude = locDetails.lat , logitude = locDetails.lng
                        {
                            // To set markers
                            let marker = GMSMarker()
                            marker.map = self.mapView
                            marker.position = CLLocationCoordinate2DMake(Double(lattitude)!, Double(logitude)!)
                            // Check for Branch or ATM
                            marker.icon = UIImage.init(named: "branchPin")
                            if locDetails.locType == "atm"
                            {
                                marker.icon = UIImage.init(named: "atmPin")
                            }
                            
                            marker.userData = locDetails
                            
                        }
                        
                    }
                }
                else
                {
                    if let error = err
                    {
                        self.showAlert(NSLocalizedString("Alert_text", comment: ""), messageStr: error.localizedDescription, preferredStyle: .Alert, target: self, onActionhandler: nil)
                      
                        
                    }
                    else
                    {
                        self.showAlert(NSLocalizedString("Alert_text", comment: ""), messageStr: NSLocalizedString("Unknwon_Error", comment: ""), preferredStyle: .Alert, target: self, onActionhandler: nil)

                    }
                   
                }
                
            }
            
        }
    }
    
    //MARK: Google Map Delegate
    func mapView(mapView: GMSMapView, didTapMarker marker: GMSMarker) -> Bool{
        if marker.userData != nil
        {
            let locationDet = marker.userData as! LocationDetail
            self.performSegueWithIdentifier("showATMLocationDetail", sender: locationDet)
        }
        
        
        return true
    }

    // Common Alert
    func showAlert(titileStr :String,messageStr:String,preferredStyle:UIAlertControllerStyle,target:UIViewController,onActionhandler:((UIAlertAction) ->Void)?)
    {
        
        let loginfailedAlert = UIAlertController(title: titileStr, message: messageStr, preferredStyle:
            preferredStyle)
        loginfailedAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: onActionhandler))
        target.presentViewController(loginfailedAlert, animated: false, completion: nil)
    }


}

