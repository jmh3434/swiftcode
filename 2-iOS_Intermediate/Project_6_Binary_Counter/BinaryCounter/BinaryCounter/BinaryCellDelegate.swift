//
//  BinaryCellDelegate.swift
//  BinaryCounter
//
//  Created by James Hunt on 7/2/21.
//

import Foundation
import UIKit

protocol BinaryCellDelegate {
    func minus(amount:Int)
    func plus(amount:Int)
}
