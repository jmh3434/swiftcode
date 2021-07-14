//
//  AuthorListTableViewController.swift
//  BookApp
//
//  Created by James Hunt on 7/14/21.
//

import UIKit

class AuthorListTableViewController: UITableViewController {
    
    var author = [Author]()
    
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            _ = try managedObjectContext.fetch(Author.fetchRequest())
        } catch {
            print("Error: \(error)")
        }
        fetchAuthors()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorCell")
        
        let authorItem = author[indexPath.row]
        cell?.textLabel!.text = authorItem.name
        return cell!
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return author.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thisAuthor = author[indexPath.row]
        performSegue(withIdentifier:"ShowBookList", sender: thisAuthor)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBookList" {
            let bookListTableViewController = segue.destination as! BookListTableViewController
            bookListTableViewController.author = sender as? Author
        }
    }
    
    @IBAction func addAuthor(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Author",
                                      message: "Add a new author",
                                      preferredStyle: .alert)

        alert.addTextField(configurationHandler: nil)
        
        let saveAction = UIAlertAction(title: "Save", style: .default)
        {
            _ in
            let textField = alert.textFields![0]
            if let newAuthor = Author(context: self.managedObjectContext) as Author? {
                newAuthor.name = textField.text!
                self.saveAuthors()
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    func saveAuthors() {
        do {
            try managedObjectContext.save()
            print("Successfully saved")
        } catch {
            print("Error when saving: \(error)")
        }
        fetchAuthors()
    }
    func fetchAuthors() {
        do {
            author = try managedObjectContext.fetch(Author.fetchRequest())
            print("Success")
        } catch {
            print("Error: \(error)")
        }
        tableView.reloadData()
    }
    
    

    
}
