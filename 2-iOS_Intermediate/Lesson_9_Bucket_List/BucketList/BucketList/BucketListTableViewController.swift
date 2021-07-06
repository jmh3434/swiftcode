//
//  BucketListTableViewController.swift
//  BucketList
//
//  Created by James Hunt on 7/5/21.
//

import UIKit

class BucketListTableViewController: UITableViewController,AddItemTableViewControllerDelegate {
    
    
    
    
    
    var items = ["Go to the moon","Master Swift","Have kids","Marry Anna"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "\(items[indexPath.row])"

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let addItemTableController = navigationController.topViewController as! AddItemTableViewController
        addItemTableController.delegate = self
        
    }
   
    
 
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        print("I'm the hidden controller, but I'm responding to the cancel button press on the top controller ")
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemTableViewController, with text: String) {
        items.append(text)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
}

   
