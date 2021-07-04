//
//  DismissViewController.swift
//  showSegue
//
//  Created by James Hunt on 7/4/21.
//

import UIKit

class DismissViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func dimissPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
