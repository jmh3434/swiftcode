//
//  BucketListTableViewController.swift
//  BucketList
//
//  Created by James Hunt on 7/5/21.
//

import UIKit
import CoreData

class BucketListTableViewController: UITableViewController,AddItemTableViewControllerDelegate {
    
   
    var newItems = [NSDictionary]()

    override func viewDidLoad() {
        
        
        getTasks()
        
        super.viewDidLoad()
    }
    
    func getTasks(){
        newItems.removeAll()
        TaskModel.getAllTasks() { [self]
                data, response, error in
                do {
                    if let tasks = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray {
                        for item in tasks {

                            newItems.append(item as! NSDictionary)
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let objective = newItems[indexPath.row]["objective"]
        cell.textLabel?.text = objective as? String
        
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
            
            addItemTableController.item = newItems[indexPath.row]["objective"]! as? String
            
            addItemTableController.indexPath = indexPath
        }
    }
    
  
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath:NSIndexPath?) {
        
        
        
        if let ip = indexPath {
            let item = newItems[ip.row]
            item.setValue(text, forKey: "objective")
            let id = item.value(forKey: "id") as! Int
            TaskModel.updateTask(id: id, task: item) {_,_,_ in
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }

        } else {


            TaskModel.addTaskWithObjective(objective: text) {_,_,_ in
                DispatchQueue.main.async {
                    self.getTasks()
                    self.tableView.reloadData()
                }
            }
        }
        
        
        
        
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        

        
        let id = newItems[indexPath.row].value(forKey: "id")
        
        TaskModel.deleteTask(id: id as! Int) {_,_,_ in
            
            
            DispatchQueue.main.async { [self] in
                newItems.remove(at: indexPath.row)
                tableView.reloadData()
                
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "toAddItem", sender: indexPath)
    }
}


