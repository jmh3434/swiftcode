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
    @IBOutlet weak var randomNumberLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Ready?"
        
        
    }
    @IBAction func coldCallPressed(_ sender: UIButton) {
        
        let randomIndex = Int.random(in: 0..<nameArray.count)
        
        let randomNumber = Int.random(in: 1...5)
        
        switch randomNumber {
        case 1,2:
            randomNumberLabel.textColor = .red
        case 3,4:
            randomNumberLabel.textColor = .orange
        default:
            randomNumberLabel.textColor = .green
        }
        
        nameLabel.text = nameArray[randomIndex]
        randomNumberLabel.text = "\(randomNumber)"
        
    }
    

}

