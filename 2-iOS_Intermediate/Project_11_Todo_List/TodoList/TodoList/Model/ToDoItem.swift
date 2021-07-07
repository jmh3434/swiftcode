//
//  ToDoItem.swift
//  TodoList
//
//  Created by James Hunt on 7/6/21.
//

import Foundation
import UIKit

class ToDoItem {
    var title:String
    var date:Date
    var itemDescription:String
    
    init(title:String,date:Date,description:String) {
        self.title = title
        self.date = date
        self.itemDescription = description
    }
}
