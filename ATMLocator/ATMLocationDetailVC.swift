//
//  ATMLocationDetailVC.swift
//  ATMLocator
//
//  Created by neelam_v on 04/10/16.
//  Copyright © 2016 neelam_v. All rights reserved.
//

// Class for ATM/Branch Details
import UIKit

class ATMLocationDetailVC: UIViewController
{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var driverUpHoursTextView: UITextView!
    @IBOutlet weak var lobbyHoursTextView: UITextView!
    @IBOutlet weak var branchPhoneNumberLabel: UILabel!
    @IBOutlet weak var numberOfAtms: UILabel!
    @IBOutlet weak var atmServicesTextView: UITextView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var bankLabel: UILabel!
    @IBOutlet weak var atmBranchAddressTextView: UITextView!
    var locationDetailModel : LocationDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpView()
    }
    
    // Set up view with details of ATM/Branch
    func setUpView() {
        
        if let name = locationDetailModel?.name
        {
            self.nameLabel.text = name
        }
        if let atms = locationDetailModel?.atms
        {
            self.numberOfAtms.text = String(atms)
        }
        if let type = locationDetailModel?.type
        {
            self.typeLabel.text = type
        }
        
        if let driveUpHrs = locationDetailModel?.driveUpHrs
        {
            if driveUpHrs.count != 0
            {
                self.driverUpHoursTextView.text = String(driveUpHrs)
            }
        }
        
        if let lobbyHrs = locationDetailModel?.lobbyHrs
        {
            if lobbyHrs.count != 0
            {
                self.lobbyHoursTextView.text = String(lobbyHrs)
            }
        }
        
        if let phone = locationDetailModel?.phone
        {
            self.branchPhoneNumberLabel.text = phone
        }
        if let services = locationDetailModel?.services
        {
            if services.count != 0
            {
                self.atmServicesTextView.text = String(services)
            }
        }
        if let bank = locationDetailModel?.bank
        {
            self.bankLabel.text = bank
        }
        var address = ""
        var city = ""
        var state = ""
        var zip = ""
        
        if let locationAddress = locationDetailModel?.address
        {
            address = String(locationAddress)
            
        }
        if let locationCity = locationDetailModel?.city
        {
            city = String(locationCity)
        }
        if let locationState = locationDetailModel?.state
        {
            state = String(locationState)
        }
        if let locationZip = locationDetailModel?.zip
        {
            zip = String(locationZip)
        }
        
        self.atmBranchAddressTextView.text =  address + ", " + city + ", " + state + ", " + zip

    }
    
}
