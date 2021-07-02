//
//  BeastTableViewCell.swift
//  BeastList
//
//  Created by James Hunt on 7/2/21.
//

import UIKit

class BeastTableViewCell:UITableViewCell {
    var delegate: BeastCellDelegate?
    @IBAction func showButtonPressed(_ sender: UIButton) {
        delegate?.showTaskDescription(description: (self.textLabel?.text)!)
    }
    
}
