//
//  ViewController.swift
//  ColdCall
//
//  Created by James Hunt on 6/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    let nameArray = ["James","David","Bekah","Susan","Keith","Matthew","Harmon"]
    
    @IBOutlet weak var nameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Ready?"
        
        
    }
    @IBAction func coldCallPressed(_ sender: UIButton) {
        
        let randomIndex = Int.random(in: 0..<nameArray.count)
        
        nameLabel.text = nameArray[randomIndex]
        
    }
    

}

