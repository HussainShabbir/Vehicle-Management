//
//  AddVehicleViewController.swift
//  VehicleManagement
//
//  Created by Hussain  on 6/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

import Cocoa

protocol AddVehicleViewControllerDelegate{
    func addModelInList(model : GroupModel, vehicleType withTypes : String)
}

class AddVehicleViewController: NSViewController {
    var delegate : AddVehicleViewControllerDelegate?
    var viewController : ViewController!
    var vehicleType : String?
    var vehicleItem : String?
    var vehicleDescription : String?
    dynamic var isDoneButtonEnable : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func doSaveOnDone(sender : AnyObject){
        
        print(vehicleType)
        print(vehicleItem)
        print(vehicleDescription)
        let model = GroupModel(itemName: vehicleItem!, itemDescription: vehicleDescription!, isDataItem: false, isChildItem: false, image: (vehicleType == "Four Wheeler") ? NSImage(named: "car")! : NSImage(named: "bike")!)
        self.delegate?.addModelInList(model, vehicleType: self.vehicleType!)
        self.dismissController(self)
    }
    
    override func controlTextDidChange(obj: NSNotification) {
        if (vehicleType?.characters.count > 0  && vehicleItem?.characters.count > 0 && vehicleDescription?.characters.count > 0){
            isDoneButtonEnable = true
        }
        else
        {
            isDoneButtonEnable = false
        }
        
    }
}
