//
//  ViewController.swift
//  MadLibs
//
//  Created by James Hunt on 7/5/21.
//

import UIKit

class FirstViewController: UIViewController {
    
    var wordsEnteredDic:[String:String]?
    @IBOutlet weak var sentenceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let words = wordsEnteredDic {
            if let word1 = words["adjective"], let word2 = words["verb1"], let word3 = words["verb2"], let word4 = words["noun"] {
                sentenceLabel.text = "We are having a perfectly \(word1) time right now. Later we will \(word2) and \(word3) in the \(word4)"
            }
        }
    }
    @IBAction func createButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "page2", sender: nil)
    }
    
    @IBAction func backToFirst(_ segue:UIStoryboardSegue){}

}

