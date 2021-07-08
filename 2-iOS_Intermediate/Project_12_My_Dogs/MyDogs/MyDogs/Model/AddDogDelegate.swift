//
//  AddDogDelegate.swift
//  MyDogs
//
//  Created by James Hunt on 7/7/21.
//

import Foundation
import UIKit

protocol AddDogDelegate {
    func addDogPressed(controller:UIViewController,dog:DogItem)
    func saveDogPressed(controller:UIViewController,dog:DogItem, at IndexPath:NSIndexPath?)
    func deleteDogPressed(controller:UIViewController,dog:DogItem, at indexPath:NSIndexPath?)
}
