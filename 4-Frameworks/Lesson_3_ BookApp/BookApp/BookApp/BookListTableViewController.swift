//
//  BookListTableViewController.swift
//  BookApp
//
//  Created by James Hunt on 7/14/21.
//

import UIKit


class BookListTableViewController: UITableViewController {
    
    var author: Author!
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = author.name! as String

    }
    @IBAction func addBook(sender: UIBarButtonItem) {
            let alert = UIAlertController(title: "New Book", message: "Add a new Book",
                                          preferredStyle: .alert)
            let newRowIndex = self.author.books?.count
            let saveAction = UIAlertAction(title: "Save", style: .default) {
                _ in
                let textField = alert.textFields![0]
                let newBook = Book(context: self.managedObjectContext)
                newBook.title = textField.text
                self.author.addToBooks(newBook)
                do {
                    try self.managedObjectContext.save()
                    print("Success!")
                } catch {
                    print("Error: \(error)")
                }
                let indexPath = IndexPath(row: newRowIndex!, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default) {
                UIAlertAction -> Void in
            }
            alert.addTextField {
                UITextField -> Void in
            }
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return author.books!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let book = self.author.books?[indexPath.row] as! Book
        cell.textLabel?.text = book.title
        return cell
    }
    

    
}

