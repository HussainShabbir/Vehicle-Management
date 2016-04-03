//
//  VehicleManagementModelController.swift
//  VehicleManagement
//
//  Created by Hussain  on 5/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

import Cocoa

class VMModelController: VMBaseModelController {

    var groupModel : VMModel!
    var dataModelOfFourWheeler : VMModel!
    var dataModelOfTwoWheeler : VMModel!
    override func updateModel() ->  VMModel?{
        self.groupModel = VMModel(itemName: kVehicleTypes, itemDescription : kHeaderDescription,isDataItem:true, isChildItem: true, image: NSImage(named: kCarImage)!)
        
        dataModelOfFourWheeler = VMModel(itemName: kFourWheeler,itemDescription : kFourWheelerDescription,isDataItem:false, isChildItem: true, image: NSImage(named: kCarImage)!)
        
        dataModelOfFourWheeler.dataList.append(VMModel(itemName: kFourWheelerName,itemDescription : kFourWheelerDescription,isDataItem:false, isChildItem: false, image: NSImage(named: kCarImage)!))
        
        dataModelOfTwoWheeler = VMModel(itemName: kTwoWheeler,itemDescription : kTwoWheelerDescriptionHeader,isDataItem:false, isChildItem: true, image: NSImage(named: kBikeImage)!)
            
        dataModelOfTwoWheeler.dataList.append(VMModel(itemName: kMotorCycle,itemDescription : kTwoWheelerDescriptionHeader,isDataItem:false, isChildItem: false, image: NSImage(named: kBikeImage)!))
        
        self.groupModel.dataList.append(dataModelOfFourWheeler)
        self.groupModel.dataList.append(dataModelOfTwoWheeler)
        return self.groupModel!
    }
    
    func addModelInList(model : VMModel, vehicleType withTypes : String) -> VMModel
    {
        if (self.dataModelOfFourWheeler.itemName == withTypes)
        {
            self.dataModelOfFourWheeler.dataList.append(model)
        }
        else if (self.dataModelOfTwoWheeler.itemName == withTypes)
        {
            self.dataModelOfTwoWheeler.dataList.append(model)
        }
        return self.groupModel
    }
    
    func removeModelInList(model : VMModel,vehicleType withTypes : String) -> VMModel
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
