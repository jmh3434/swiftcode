//
//  AddItemTableViewController.swift
//  BucketList
//
//  Created by James Hunt on 7/5/21.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    var delegate:AddItemTableViewControllerDelegate?
    
    var item:String?
    var indexPath:NSIndexPath?
    
    @IBOutlet weak var itemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let itemToEdit = item {
            itemTextField.text = itemToEdit
        }

    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    @IBAction func saveButtonPressed(_ sender: Any) {
        let text = itemTextField.text!
        delegate?.itemSaved(by: self, with: text, at:indexPath)
    }
    
    
    
}
