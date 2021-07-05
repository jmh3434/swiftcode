//
//  SecondViewController.swift
//  MadLibs
//
//  Created by James Hunt on 7/5/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    var wordDic = [String:String]()
    
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let word1 = textFields[0].text,
              let word2 = textFields[1].text, let word3 = textFields[2].text, let word4 = textFields[3].text {
            wordDic["adjective"] = word1
            wordDic["verb1"] = word2
            wordDic["verb2"] = word3
            wordDic["noun"] = word4
        }
        let controller = segue.destination as! FirstViewController
        controller.wordsEnteredDic = wordDic
    }
    

    

}
