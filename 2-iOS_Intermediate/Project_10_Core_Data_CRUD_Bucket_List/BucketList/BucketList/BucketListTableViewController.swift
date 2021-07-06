//
//  BucketListTableViewController.swift
//  BucketList
//
//  Created by James Hunt on 7/5/21.
//

import UIKit
import CoreData

class BucketListTableViewController: UITableViewController,AddItemTableViewControllerDelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext

    
    var items = [BucketListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "\(items[indexPath.row].text!)"

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
            
            addItemTableController.item = items[indexPath.row].text!
            
            addItemTableController.indexPath = indexPath
        }
    }
   
    func fetchAllItems(){
        let request:NSFetchRequest<BucketListItem> = BucketListItem.fetchRequest()
        do {
            let result = try managedObjectContext.fetch(request)
            // Here we can store the fetched data in an array
            items = result
        } catch {
            print(error)
        }
        
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
       
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath:NSIndexPath?) {
        
        if let ip = indexPath {
            let item = items[ip.row]
            item.text = text
            
        } else {
            
            let item = BucketListItem(context: managedObjectContext)
            item.text = text

            items.append(item)
        }
        saveContext()
        
       
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        managedObjectContext.delete(item)
        
        saveContext()
    
        items.remove(at: indexPath.row)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "toAddItem", sender: indexPath)
    }
}

   
