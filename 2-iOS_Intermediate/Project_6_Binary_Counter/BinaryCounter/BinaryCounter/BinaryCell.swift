//
//  BinaryCell.swift
//  BinaryCounter
//
//  Created by James Hunt on 7/2/21.
//

import UIKit

class BinaryCell:UITableViewCell {
    
    var delegate:BinaryCellDelegate?
    var amount:Int?
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBAction func minusPressed(_ sender: UIButton) {
        if let amountToSubtract = amount {
            delegate?.minus(amount: amountToSubtract)
        }
        
    }
    @IBAction func plusPressed(_ sender: UIButton) {
        if let amountToAdd = amount {
            delegate?.plus(amount: amountToAdd)
        }
    }
    
    
    
}
