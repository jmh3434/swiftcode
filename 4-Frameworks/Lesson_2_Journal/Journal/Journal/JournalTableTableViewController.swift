//
//  JournalTableTableViewController.swift
//  Journal
//
//  Created by James Hunt on 7/13/21.
//

import UIKit
import CoreData

class JournalTableViewController: UITableViewController {
    
    var journal = [Journal]()
    
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            _ = try managedObjectContext.fetch(Journal.fetchRequest())
        } catch {
            print("Error: \(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journal.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let journalItem = journal[indexPath.row]
        cell.textLabel!.text = journalItem.title
        return cell
    }
   
    @IBAction func addJournal(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Entry",
                                      message: "Add a new journal entry",
                                      preferredStyle: .alert)

        alert.addTextField(configurationHandler: nil)
        
        let saveAction = UIAlertAction(title: "Save", style: .default)
        {
            _ in
            let textField = alert.textFields![0]
            if let newJournalEntry = Journal(context: self.managedObjectContext) as Journal? {
                newJournalEntry.title = textField.text!
                //                        newJournalEntry.createdAt = Date() as NSDate?
                self.saveJournalEntries()
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func saveJournalEntries() {
        do {
            try managedObjectContext.save()
            print("Successfully saved")
        } catch {
            print("Error when saving: \(error)")
        }
        fetchJournalEntries()
    }
    func fetchJournalEntries() {
        do {
            journal = try managedObjectContext.fetch(Journal.fetchRequest())
            print("Success")
        } catch {
            print("Error: \(error)")
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        managedObjectContext.delete(journal[indexPath.row])
        self.saveJournalEntries()
    }
    
    
    
}
