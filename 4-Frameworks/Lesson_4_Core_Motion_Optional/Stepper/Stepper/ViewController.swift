//
//  ViewController.swift
//  Stepper
//
//  Created by James Hunt on 7/15/21.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    var motionManager = CMMotionManager()
    let opQueue = OperationQueue()
    override func viewDidLoad() {
        super.viewDidLoad()
        if motionManager.isDeviceMotionAvailable {
            print("We can detect device motion")
            startReadingMotionData()
        }
        else {
            print("We cannot detect device motion")
        }
    }
    func startReadingMotionData() {
        // set read speed
        motionManager.deviceMotionUpdateInterval = 1
        // start reading
        motionManager.startDeviceMotionUpdates(to: opQueue) {
            (data: CMDeviceMotion?, error: Error?) in
            if let mydata = data {
                print("mydata.gravity", mydata.gravity)
                print("pitch raw", mydata.attitude.pitch)
                print("pitch", self.degrees(mydata.attitude.pitch))
            }
        }
    }
    func degrees(_ radians: Double) -> Double {
        return 180/Double.pi * radians
    }
}
