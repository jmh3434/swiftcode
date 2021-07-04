//
//  ViewController.swift
//  PrepareForSegue
//
//  Created by James Hunt on 7/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let text = textField.text
        let secondVC = segue.destination as! SecondVC
        secondVC.outputText = text
    }


}

