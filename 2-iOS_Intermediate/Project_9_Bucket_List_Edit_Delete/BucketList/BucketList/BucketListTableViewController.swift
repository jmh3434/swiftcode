//
//  BucketListTableViewController.swift
//  BucketList
//
//  Created by James Hunt on 7/5/21.
//

import UIKit

class BucketListTableViewController: UITableViewController,AddItemTableViewControllerDelegate {
    
    
    
    
    
    
    
    var items = ["Go to the moon","Master Swift","Have kids","Fish at the beach"]

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
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toAddItem", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let _ = sender as? UIBarButtonItem {
            let navigationController = segue.destination as! UINavigationController
            
            let addItemTableController = navigationController.topViewController as! AddItemTableViewController
            addItemTableController.delegate = self
        }
        
        if let indexPath = sender as? NSIndexPath {
            let navigationController = segue.destination as! UINavigationController
            
            let addItemTableController = navigationController.topViewController as! AddItemTableViewController
            addItemTableController.delegate = self
            
            addItemTableController.item = items[indexPath.row]
            
            addItemTableController.indexPath = indexPath
        }
    }
   
    
 
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
       
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath:NSIndexPath?) {
        
        if let ip = indexPath {
            items[ip.row] = text
        } else {
            items.append(text)
        }
       
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//
//        performSegue(withIdentifier: "toAddItem", sender: indexPath)
//    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "toAddItem", sender: indexPath)
    }
    
}

   
