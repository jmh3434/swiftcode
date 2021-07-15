//
//  SportTableViewCell.swift
//  SportsApp
//
//  Created by James Hunt on 7/15/21.
//

import UIKit
protocol SportCellDelegate: AnyObject {
    func addImage(cell: SportTableViewCell)
}

class SportTableViewCell: UITableViewCell {

    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var sportLabel: UILabel!
    
    var delegate: SportCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func imageButtonPressed(_ sender: UIButton) {
        delegate?.addImage(cell: self)
    }
    
        
    

}
