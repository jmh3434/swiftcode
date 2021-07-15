//
//  SportListTableViewController.swift
//  SportsApp
//
//  Created by James Hunt on 7/14/21.
//

import UIKit

protocol ImageProducer {
    func addImage(imageName:String?)
}

class SportListTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,SportCellDelegate, ImageProducer {

    var sport = [Sport]()
    var indexPathForCell:NSIndexPath?
    
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    func addImage(imageName: String?) {
        sport[indexPathForCell!.row].image = imageName
        
        tableView.reloadData()
    }
    func addImage(cell: SportTableViewCell) {
        indexPathForCell = self.tableView.indexPath(for: cell) as NSIndexPath?
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            _ = try managedObjectContext.fetch(Sport.fetchRequest())
        } catch {
            print("Error: \(error)")
        }
        fetchSports()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SportTableViewCell
        cell.delegate = self
        let sportItem = sport[indexPath.row]
        
        cell.sportLabel!.text = "\(sportItem.title ?? "title")"
        

    
        if let image = sportItem.image {
            DispatchQueue.main.async {
                let path = self.getDocumentsDirectory().appendingPathComponent(image)
                let newImage = UIImage(contentsOfFile: path.path)
                cell.imageButton.setBackgroundImage(newImage, for: .normal)
                cell.imageButton.setTitle("", for: .normal)
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sport.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thisSport = sport[indexPath.row]
        performSegue(withIdentifier:"ShowPlayerList", sender: thisSport)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        managedObjectContext.delete(sport[indexPath.row])
        self.saveSports()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPlayerList" {
            let playerListTableViewController = segue.destination as! PlayerListTableViewController
            playerListTableViewController.sport = sender as? Sport
        }
    }
    
    @IBAction func addSport(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Sport",
                                      message: "Add a new Sport",
                                      preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        
        let saveAction = UIAlertAction(title: "Save", style: .default)
        {
            _ in
            let textField = alert.textFields![0]
            if let newSport = Sport(context: self.managedObjectContext) as Sport? {
                newSport.title = textField.text!
                self.saveSports()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var delegate: ImageProducer?
        delegate = self
        
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
    
        delegate?.addImage(imageName: imageName)
        
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func saveSports() {
        do {
            try managedObjectContext.save()
            print("Successfully saved")
        } catch {
            print("Error when saving: \(error)")
        }
        fetchSports()
    }
    func fetchSports() {
        do {
            sport = try managedObjectContext.fetch(Sport.fetchRequest())
            print("Success")
        } catch {
            print("Error: \(error)")
        }
        tableView.reloadData()
    }
    
}
