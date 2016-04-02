//
//  WindowController.swift
//  VehicleManagement
//
//  Created by Hussain  on 5/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    var arrayList = [AnyObject]()
    override func windowDidLoad() {
        super.windowDidLoad()
        let modelController = VehicleManagementModelController()
        let model = modelController.updateModel()
        let vwController = self.contentViewController as! ViewController
        vwController.modelController = modelController
        self.contentViewController?.representedObject = model

    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
}
