//
//  AddDogDelegate.swift
//  MyDogs
//
//  Created by James Hunt on 7/7/21.
//

import Foundation
import UIKit

protocol AddDogDelegate {
    func addDogPressed(controller:UIViewController,dog:Dog)
    func saveDogPressed(controller:UIViewController,dog:Dog, at IndexPath:NSIndexPath?)
    func deleteDogPressed(controller:UIViewController,dog:Dog, at indexPath:NSIndexPath?)
}
