//
//  ViewController.swift
//  iOSQuiz
//
//  Created by James Hunt on 6/29/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    let quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // if answerLabel is not hidden, then make it hidden
        // else set it not hidden
        
        if answerLabel.isHidden == true {
            answerLabel.isHidden = false
        }else {
            answerLabel.isHidden = true
        }
        
    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        // if currentQuestion is less than the count of quizBank - 1 then currentQuestion++
        // else set currentQuestion to 0
        
        if quiz.currentQuestion < Quiz.quizBank.count - 1 {
            quiz.currentQuestion += 1
        }else{
            quiz.currentQuestion = 0
        }
        
        updateUI()
    }
    
    func updateUI(){
        questionLabel.text = Quiz.quizBank[quiz.currentQuestion].0
        answerLabel.text = Quiz.quizBank[quiz.currentQuestion].1
        
        answerLabel.isHidden = true
    }
    
}

