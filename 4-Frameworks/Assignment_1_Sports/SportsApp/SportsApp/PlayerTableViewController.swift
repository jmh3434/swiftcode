//
//  PlayerTableViewController.swift
//  SportsApp
//
//  Created by James Hunt on 7/14/21.
//

import UIKit
import CoreData

class PlayerListTableViewController: UITableViewController {
    
    var sport: Sport!
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = sport.title! as String

    }
    @IBAction func addPlayer(sender: UIBarButtonItem) {
            let alert = UIAlertController(title: "New Player", message: "Add a new Player",
                                          preferredStyle: .alert)
            let newRowIndex = self.sport.players?.count
            let saveAction = UIAlertAction(title: "Save", style: .default) {
                _ in
                let textField1 = alert.textFields![0]
                let textField2 = alert.textFields![1]
                let textField3 = alert.textFields![2]
                
                let newPlayer = Player(context: self.managedObjectContext)
                newPlayer.name = textField1.text
                newPlayer.age = textField2.text
                newPlayer.height = textField3.text
                
                self.sport.addToPlayers(newPlayer)
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
                let indexPath = IndexPath(row: newRowIndex!, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default) {
                UIAlertAction -> Void in
            }
            alert.addTextField { (textField1) in textField1.placeholder = "Enter First and Last Name"
            }
            alert.addTextField { (textField2) in
                textField2.placeholder = "Enter Age"
            }
            alert.addTextField { (textField3) in
                textField3.placeholder = "Enter Height"
            }
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sport.players!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.accessoryType = .detailButton
        let player = self.sport.players?[indexPath.row] as! Player
        cell.textLabel?.text = "\(player.name ?? "name") – Age: \(player.age ?? "age"), Height: \(player.height ?? "height")"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let player = self.sport.players?[indexPath.row] as! Player
        self.sport.removeFromPlayers(player)
        tableView.reloadData()
       
    }
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let alert = UIAlertController(title: "Edit Player", message: "Edit Player",
                                      preferredStyle: .alert)
        
        let player = self.sport.players?[indexPath.row] as! Player
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            _ in
            let textField1 = alert.textFields![0]
            let textField2 = alert.textFields![1]
            let textField3 = alert.textFields![2]
            
            player.name = textField1.text
            player.age = textField2.text
            player.height = textField3.text
            
            do {
                try self.managedObjectContext.save()
            } catch {
                print(error)
            }
            tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) {
            UIAlertAction -> Void in
        }
        alert.addTextField { (textField1) in
            textField1.text = player.name
            if player.name == "" {
                textField1.placeholder = "name"
            }
        }
        alert.addTextField { (textField2) in
            textField2.text = player.age
            if player.age == "" {
                textField2.placeholder = "age"
            }
        }
        alert.addTextField { (textField3) in
            textField3.text = player.height
            if player.height == "" {
                textField3.placeholder = "height"
            }
        }

        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}

