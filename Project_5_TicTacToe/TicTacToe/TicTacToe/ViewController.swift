//
//  ViewController.swift
//  TicTacToe
//
//  Created by James Hunt on 6/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    var firstPlayerTurn = Bool()
    
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    var winArr:[Int] = Array(repeating: 0, count: 9)

    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPlayerTurn = true
        clearButtons()
    }
    
    func clearButtons() {
        for button in buttons {
            button.backgroundColor = .gray
            button.isUserInteractionEnabled = true
        }
        winnerLabel.text = ""
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        clearButtons()
        
        for (index,_) in winArr.enumerated() {
            winArr[index] = 0
            winnerLabel.backgroundColor = .clear
            
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        
    
        if firstPlayerTurn {
            winArr[sender.tag] = 1
            sender.backgroundColor = .systemTeal
            firstPlayerTurn = false
        }else{
            winArr[sender.tag] = 2
            sender.backgroundColor = .systemPink
            firstPlayerTurn = true
        }
        sender.isUserInteractionEnabled = false
        
        if checkForWinners() == 1 {
            winnerLabel.text = "First Player Won"
            winnerLabel.backgroundColor = .systemTeal
        }else if checkForWinners() == 2 {
            winnerLabel.text = "Second Player Won"
            winnerLabel.backgroundColor = .systemPink
        }
        
        
    }
    func checkForWinners() -> Int {
       let winningPossibilities = [
        [winArr[0],winArr[1],winArr[2]],
        [winArr[3],winArr[4],winArr[5]],
        [winArr[6],winArr[7],winArr[8]],
        [winArr[0],winArr[3],winArr[6]],
        [winArr[1],winArr[4],winArr[7]],
        [winArr[2],winArr[5],winArr[8]],
        [winArr[0],winArr[4],winArr[8]],
        [winArr[6],winArr[4],winArr[2]],
        [winArr[1],winArr[4],winArr[7]]
       ]
        
        for winningTrio in winningPossibilities {
        
            if winningTrio.allSatisfy({$0==1}) {
                return 1
            }else if winningTrio.allSatisfy({$0==2}) {
                return 2
            }
        }
        return 3
    }
    
    
//    [0,1,2]
//    [3,4,5]
//    [6,7,8]
    
//    0,1,2
//    3,4,5
//    6,7,8
//    0,3,6
//    1,4,7
//    2,5,8
//    0,4,8
//    6,4,2
//    1,4,7
    
}

