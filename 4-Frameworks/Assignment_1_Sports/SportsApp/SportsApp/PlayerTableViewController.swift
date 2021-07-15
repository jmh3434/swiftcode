//
//  PlayerTableViewController.swift
//  SportsApp
//
//  Created by James Hunt on 7/14/21.
//

import UIKit


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
                let textField = alert.textFields![0]
                let newPlayer = Player(context: self.managedObjectContext)
                newPlayer.name = textField.text
                self.sport.addToPlayers(newPlayer)
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
        return sport.players!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let player = self.sport.players?[indexPath.row] as! Player
        cell.textLabel?.text = player.name
        return cell
    }
    

    
}

