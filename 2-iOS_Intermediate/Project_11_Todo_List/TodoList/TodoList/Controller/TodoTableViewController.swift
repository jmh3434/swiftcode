//
//  TableViewController.swift
//  TodoList
//
//  Created by James Hunt on 7/6/21.
//

import UIKit
import CoreData

class TodoTableViewController: UITableViewController, AddItemDelegate{
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext

    var items = [TodoListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    }
    func fetchAllItems(){
        let request:NSFetchRequest<TodoListItem> = TodoListItem.fetchRequest()
        do {
            let result = try managedObjectContext.fetch(request)
            // Here we can store the fetched data in an array
            items = result
        } catch {
            print(error)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddItemViewController
        vc.delegate = self
    }
    @IBAction func addItem(_ sender: Any) {
        
        performSegue(withIdentifier: "addItem", sender: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TodoTableViewCell
        
        cell.title.text = items[indexPath.row].title
        
        if let dateAtRow = items[indexPath.row].date {
            let formattedDate = dateAtRow.getFormattedDate(format: "MM/dd/yyyy")
            cell.date.text = "\(formattedDate)"
        }
    
        cell.todoDescription.text = items[indexPath.row].itemDescription

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                
            } else {
                cell.accessoryType = .checkmark
                
            }
        }
    }
    func addItemPressed(by controller: UIViewController,item:ToDoItem) {
        
        let newItem = TodoListItem(context: managedObjectContext)
        newItem.date = item.date
        newItem.title = item.title
        newItem.itemDescription = item.itemDescription
        
        items.append(newItem)
        saveContext()
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
