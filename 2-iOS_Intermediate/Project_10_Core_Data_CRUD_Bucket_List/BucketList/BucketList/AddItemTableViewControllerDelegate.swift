//
//  AddItemTableViewControllerDelegate.swift
//  BucketList
//
//  Created by James Hunt on 7/5/21.
//

import Foundation
import UIKit

protocol AddItemTableViewControllerDelegate {
    func itemSaved(by controller:AddItemTableViewController,with text:String, at IndexPath:NSIndexPath?)
    func cancelButtonPressed(by controller:AddItemTableViewController)
}
