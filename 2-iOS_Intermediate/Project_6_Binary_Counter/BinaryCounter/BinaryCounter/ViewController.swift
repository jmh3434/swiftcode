//
//  ViewController.swift
//  BinaryCounter
//
//  Created by James Hunt on 7/2/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var total = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BinaryCell
        cell.delegate = self
        
        let powerofTen = Int(truncating: pow(10,indexPath.row) as NSNumber)
        cell.amount = powerofTen
        cell.valueLabel.text = "\(powerofTen)"
        
        return cell
    }
}

extension ViewController:BinaryCellDelegate{
    func minus(amount: Int) {
        total-=amount
        totalLabel.text = "Total: \(total)"
    }
    
    func plus(amount: Int) {
        total+=amount
        totalLabel.text = "Total: \(total)"
    }
    
    
}
