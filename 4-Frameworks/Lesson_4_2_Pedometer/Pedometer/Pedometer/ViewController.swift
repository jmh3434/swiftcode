//
//  ViewController.swift
//  Pedometer
//
//  Created by James Hunt on 7/15/21.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    let pedometer: CMPedometer = CMPedometer()
    @IBOutlet weak var stepCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func resetButtonPressed(sender: UIButton) {
        pedometer.stopUpdates()
        stepCount.text = "0"
    }
    @IBAction func startButtonPressed(sender: UIButton) {
        pedometer.startUpdates(from:Date(), withHandler: { data, error in
            print(data!)
            let numSteps = data?.numberOfSteps
            DispatchQueue.main.async {
                self.stepCount.text = "\(numSteps ?? 0)"
            }
        })
    }
}
