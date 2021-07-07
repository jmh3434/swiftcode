//
//  AddItemDelegate.swift
//  TodoList
//
//  Created by James Hunt on 7/6/21.
//

import Foundation
import UIKit

protocol AddItemDelegate {
    func addItemPressed(by controller:UIViewController, item:ToDoItem)
}
