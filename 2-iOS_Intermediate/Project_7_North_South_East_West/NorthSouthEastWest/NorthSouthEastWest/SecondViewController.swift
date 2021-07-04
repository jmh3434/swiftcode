//
//  SecondViewController.swift
//  NorthSouthEastWest
//
//  Created by James Hunt on 7/4/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var directionButton: UIButton!
    
    var direction:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        directionButton.setTitle(direction, for: .normal)
    }
    
       
    

}
