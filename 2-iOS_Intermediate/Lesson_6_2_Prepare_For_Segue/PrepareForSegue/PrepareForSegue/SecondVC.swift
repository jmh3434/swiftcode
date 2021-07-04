//
//  SecondVC.swift
//  PrepareForSegue
//
//  Created by James Hunt on 7/4/21.
//

import UIKit

class SecondVC: UIViewController {
    @IBOutlet weak var outputLabel: UILabel!
    
    var outputText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = outputText
    }
    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    

}
