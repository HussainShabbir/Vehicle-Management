//
//  VehicleManagementModelController.swift
//  VehicleManagement
//
//  Created by Hussain  on 5/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

import Cocoa

class VehicleManagementModelController: ModelController {

    var groupModel : GroupModel!
    var dataModelOfFourWheeler : GroupModel!
    var dataModelOfTwoWheeler : GroupModel!
    override func updateModel() ->  GroupModel?{
        self.groupModel = GroupModel(itemName: "Vehicle Types", itemDescription : "This contains the types of vehicle",isDataItem:true, isChildItem: true, image: NSImage(named: "car")!)
        
        dataModelOfFourWheeler = GroupModel(itemName: "Four Wheeler",itemDescription : "This contains the list of Four Wheeler",isDataItem:false, isChildItem: true, image: NSImage(named: "car")!)
        
        dataModelOfFourWheeler.dataList.append(GroupModel(itemName: "Maruti",itemDescription : "This is the Maruti 800",isDataItem:false, isChildItem: false, image: NSImage(named: "car")!))
        
        dataModelOfTwoWheeler = GroupModel(itemName: "Two Wheeler",itemDescription : "This is the two Wheeler",isDataItem:false, isChildItem: true, image: NSImage(named: "bike")!)
            
        dataModelOfTwoWheeler.dataList.append(GroupModel(itemName: "Motor Cycle",itemDescription : "This is the the Yamaha FZ",isDataItem:false, isChildItem: false, image: NSImage(named: "bike")!))
        
        self.groupModel.dataList.append(dataModelOfFourWheeler)
        self.groupModel.dataList.append(dataModelOfTwoWheeler)
        return self.groupModel!
    }
    
    func addModelInList(model : GroupModel, vehicleType withTypes : String) -> GroupModel
    {
        if (self.dataModelOfFourWheeler.itemName == withTypes)
        {
            self.dataModelOfFourWheeler.dataList.append(model)
        }
        else if (self.dataModelOfTwoWheeler.itemName == withTypes)
        {
            self.dataModelOfTwoWheeler.dataList.append(model)
        }
        print(self.groupModel)
        return self.groupModel
    }
    
    func removeModelInList(model : GroupModel,vehicleType withTypes : String) -> GroupModel
    {
        if (self.dataModelOfFourWheeler.itemName == withTypes)
        {
            for (var index = 0; index < self.dataModelOfFourWheeler.dataList.count; index++)
            {
                let childModel = self.dataModelOfFourWheeler.dataList[index]
                if (childModel.itemName == model.itemName){
                    self.dataModelOfFourWheeler.dataList.removeAtIndex(index)
                }
            }
        }
        else if (self.dataModelOfTwoWheeler.itemName == withTypes)
        {
            for (var index = 0; index < self.dataModelOfTwoWheeler.dataList.count; index++)
            {
                let childModel = self.dataModelOfTwoWheeler.dataList[index]
                if (childModel.itemName == model.itemName){
                    self.dataModelOfTwoWheeler.dataList.removeAtIndex(index)
                }
            }
        }
        return self.groupModel
    }
}
