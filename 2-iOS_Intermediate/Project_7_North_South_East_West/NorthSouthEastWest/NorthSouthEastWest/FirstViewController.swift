//
//  ViewController.swift
//  NorthSouthEastWest
//
//  Created by James Hunt on 7/4/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let direction = sender as! String
        
        let controller = segue.destination as! SecondViewController
        
        controller.direction = direction
    }
    
    @IBAction func directionButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "direction", sender: sender.titleLabel?.text!)
    }
    @IBAction func toMainView(_ segue:UIStoryboardSegue){
        
    }

    
    
}

