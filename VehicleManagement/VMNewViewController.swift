//
//  AddVehicleViewController.swift
//  VehicleManagement
//
//  Created by Hussain  on 6/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

import Cocoa

protocol VMNewViewControllerDelegate{
    func addModelInList(model : VMModel, vehicleType withTypes : String)
}

class VMNewViewController: NSViewController {
    var delegate : VMNewViewControllerDelegate?
    var viewController : VMViewController!
    var vehicleType : String?
    var vehicleItem : String?
    var vehicleDescription : String?
    dynamic var isDoneButtonEnable  = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func doSaveOnDone(sender : AnyObject){
        let model = VMModel(itemName: vehicleItem!, itemDescription: vehicleDescription!, isDataItem: false, isChildItem: false, image: (vehicleType == kFourWheeler) ? NSImage(named: kCarImage)! : NSImage(named: kBikeImage)!)
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
