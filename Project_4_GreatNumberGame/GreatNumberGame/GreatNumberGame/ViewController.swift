//
//  ViewController.swift
//  GreatNumberGame
//
//  Created by James Hunt on 6/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var randomNumber = Int()
    var numberOfTries = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        updateRandomNumber()
        
    }
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        if let numberInputText = textField.text {
            if let numberInput = Int(numberInputText){
                if numberInput < randomNumber {
                    createAlert(result: "Too Low")
                }else if numberInput > randomNumber{
                    createAlert(result: "Too High")
                }else {
                    createAlert(result: "You got it!")
                }
            }
            numberOfTries += 1
        }
        textField.text = ""
    }
    
    func createAlert(result:String){
    
        let alert = UIAlertController(title: "My Alert", message: "\(result). Number of tries: \(numberOfTries)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        
        if result == "Too Low" {
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.systemTeal
        }else if result == "Too High" {
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.systemPink
        }else{
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.green
        }
        alert.view.tintColor = UIColor.white

        self.present(alert, animated: true, completion: nil)
    }
    
    func updateRandomNumber(){
        randomNumber = Int.random(in: 0...100)
        print(randomNumber)
    }
    
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
