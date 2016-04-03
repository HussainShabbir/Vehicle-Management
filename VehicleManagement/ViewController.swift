//
//  ViewController.swift
//  VehicleManagement
//
//  Created by Hussain  on 5/3/16.
//  Copyright © 2016 Hussain . All rights reserved.
//

import Cocoa
// typealias isBool = Bool
class ViewController: NSViewController,AddVehicleViewControllerDelegate {

    @IBOutlet weak var outlineView : NSOutlineView!
    @IBOutlet weak var scrollView : NSScrollView!
    @IBOutlet weak var imageView : NSImageView!
    var arrayList = [AnyObject]()
    var arrayOfTableList = [AnyObject]()
    var modelController : VehicleManagementModelController!
    dynamic var isAdd : Bool = false
    dynamic var isRemove : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.documentView = self.imageView

        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.

            self.willChangeValueForKey("arrayList")
            arrayList.append(self.representedObject!)
            self.didChangeValueForKey("arrayList")
            self.outlineView.expandItem(nil, expandChildren: true)
            if (self.outlineView.numberOfRows > 1){
                self.outlineView.selectRowIndexes(NSIndexSet(index: 1), byExtendingSelection: false)
                self.isAdd = true
            }
        }
    }
    
    func outlineView(outlineView: NSOutlineView, viewForTableColumn tableColumn: NSTableColumn?, item: AnyObject) -> NSView?{
        var cellView : NSTableCellView!
        let model = item.representedObject as! GroupModel
        if (model.isDataItem == true && model.isChildItem == true){
            cellView = outlineView.makeViewWithIdentifier("HeaderCell", owner: self) as! NSTableCellView
        }
        else if (model.isDataItem == false && model.isChildItem == true){
            cellView = outlineView.makeViewWithIdentifier("DataCell", owner: self) as! NSTableCellView
        }
        else if (model.isDataItem == false && model.isChildItem == false){
            cellView = outlineView.makeViewWithIdentifier("ChildCell", owner: self) as! NSTableCellView
        }
        return cellView
    }
    
    func outlineView(outlineView: NSOutlineView, isGroupItem item: AnyObject) -> Bool{
        let model = item.representedObject as! GroupModel
        if (model.isDataItem == true && model.isChildItem == true){
            return true
        }
        else
        {
            return false
        }
    }
    
    func outlineView(outlineView: NSOutlineView, shouldExpandItem item: AnyObject) -> Bool{
        return true
    }
    
    func outlineView(outlineView: NSOutlineView, shouldShowCellExpansionForTableColumn tableColumn: NSTableColumn?, item: AnyObject) -> Bool
    {
            return true
    }
    
    func outlineViewSelectionDidChange(notification: NSNotification){
        let rowIndex = notification.object?.selectedRow
        let node = self.outlineView.itemAtRow(rowIndex!)
        let modelItem = node?.representedObject
        if (modelItem != nil){
            let model = modelItem as! GroupModel
            updateTableList(model)
            if (model.itemName == "Four Wheeler" || model.itemName == "Two Wheeler")
            {
                self.isRemove = false
            }
            else{
                self.isRemove = true
            }
            
        }
    }

    func outlineView(outlineView: NSOutlineView, shouldSelectItem item: AnyObject) -> Bool
    {
        var shouldSelectRow : Bool = false
        let model = item.representedObject as! GroupModel
        if (model.isDataItem == false && model.isChildItem == true){
            shouldSelectRow = true
        }
        else if (model.isDataItem == false && model.isChildItem == false){
            shouldSelectRow = true
        }
        return shouldSelectRow
    }
    
    func outlineView(outlineView: NSOutlineView, shouldShowOutlineCellForItem item: AnyObject) -> Bool
    {
        var shouldShowRow : Bool = false
        let model = item.representedObject as! GroupModel
        if (model.isDataItem == false && model.isChildItem == true){
            shouldShowRow = true
        }
        else if (model.isDataItem == false && model.isChildItem == false){
            shouldShowRow = true
        }
        return shouldShowRow
    }
    
    func updateTableList(model : GroupModel)
    {
        let array : [AnyObject]?
        if (model.dataList.count > 0){
            array = model.dataList
        }
        else
        {
            array = [AnyObject]()
            array?.append(model)
        }
        self.willChangeValueForKey("arrayOfTableList")
        self.arrayOfTableList = array!
        self.didChangeValueForKey("arrayOfTableList")
    }
    
    
    @IBAction func doRemoveVehicles(sender : AnyObject)
    {
        let index = self.outlineView.selectedRow
        let item = self.outlineView.itemAtRow(index)
        let childItemModel = item?.representedObject as! GroupModel
        let obj = self.outlineView?.parentForItem(item)
        let parentItemModel = obj?.representedObject as! GroupModel
        if (parentItemModel.itemName == "Four Wheeler" || parentItemModel.itemName == "Two Wheeler")
        {
            let model = self.modelController.removeModelInList(childItemModel, vehicleType: parentItemModel.itemName)
            self.willChangeValueForKey("arrayList")
            self.arrayList = []
            arrayList.append(model)
            self.didChangeValueForKey("arrayList")
            if (self.outlineView.numberOfRows > 1){
                self.outlineView.selectRowIndexes(NSIndexSet(index: 1), byExtendingSelection: false)
                self.isRemove = true
            }
            else
            {
                self.isRemove = false
            }
        }
    }
    
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
     let vwController = segue.destinationController as! AddVehicleViewController
        vwController.delegate = self
    }
    
    
    func addModelInList(model: GroupModel, vehicleType withTypes: String)
    {
       let model = self.modelController.addModelInList(model,vehicleType: withTypes)
        self.arrayList = []
        self.willChangeValueForKey("arrayList")
        self.arrayList.append(model)
        self.didChangeValueForKey("arrayList")
        if (self.outlineView.numberOfRows > 1){
            self.outlineView.selectRowIndexes(NSIndexSet(index: 1), byExtendingSelection: false)
            self.isAdd = true
            self.isRemove = true
        }
        else
        {
            self.isAdd = false
            self.isRemove = false
        }
    }

}

