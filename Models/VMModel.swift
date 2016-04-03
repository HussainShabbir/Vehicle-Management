//
//  GroupModel.swift
//  VehicleManagement
//
//  Created by Hussain  on 5/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

import Cocoa

class VMModel: NSObject {
    let itemName : String
    let itemDescription : String
    let isDataItem : Bool
    let isChildItem : Bool
    let image : NSImage
    var dataList = [AnyObject]()
    init(itemName : String, itemDescription : String,isDataItem : Bool, isChildItem : Bool,image : NSImage)
    {
        self.itemName = itemName
        self.isDataItem = isDataItem
        self.isChildItem = isChildItem
        self.itemDescription = itemDescription
        self.image = image
    }
}
