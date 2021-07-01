//
//  ViewController.swift
//  NinjaGold
//
//  Created by James Hunt on 6/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var labels: [UILabel]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score:Int = Int()
    
    let locations:[(Int,Int)] = [(10,20),(5,10),(2,5),(0,50)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score = 0
        
        for label in labels {
            label.text = ""
        }
    }

    @IBAction func earnButtonPressed(_ sender: UIButton) {
        
        var winOrLose = true
        
        let valueEarned = getRandomAmount(low: locations[sender.tag].0, high: locations[sender.tag].1)
    
        
        if sender.tag == 3 {
            // win or lose on casino
            let flipCoin = Int.random(in: 0...1)
            
            if flipCoin == 0 {
                winOrLose = false
                score -= valueEarned
            }else{
                score += valueEarned
            }
        }else{
            score += valueEarned
        }
        
        updateLocationLabel(forTag: sender.tag, amountEarned: valueEarned,winOrLose: winOrLose)
        updateScoreLabel()
    }
    
    func getRandomAmount(low:Int,high:Int) -> Int {
        return Int.random(in: low...high)
    }
    @IBAction func resetButton(_ sender: UIButton) {
        for label in labels {
            label.text = ""
        }
        score = 0
        updateScoreLabel()
    }
    
    func updateScoreLabel(){
        scoreLabel.text = "Score \(score)"
    }
    
    func updateLocationLabel(forTag tag:Int, amountEarned:Int,winOrLose:Bool) {
        var earnLoss = ""
        
        for label in labels {
            label.text = ""
        }
        if winOrLose {
            earnLoss = "earned"
        }else{
            earnLoss = "lost"
        }
        labels[tag].text = " You \(earnLoss) \(amountEarned)"
    }
    
}

