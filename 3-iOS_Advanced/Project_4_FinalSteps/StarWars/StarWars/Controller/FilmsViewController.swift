//
//  FilmsViewController.swift
//  StarWars
//
//  Created by James Hunt on 7/11/21.
//

import UIKit

class FilmsViewController: UITableViewController {

    var resultArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllFilms {
            data, result, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    
                    if let results = jsonResult["results"] {
                        self.resultArray = results as! NSArray
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
        // #warning Incomplete implementation, return the number of rows
        return resultArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if let filmDict = resultArray[indexPath.row] as? NSDictionary {
            cell?.textLabel?.text = filmDict["title"] as? String
        }
            

        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "filmDetail", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = sender as! NSIndexPath
        
        let vc = segue.destination as! FilmDetailViewController
        
        vc.film = resultArray[indexPath.row] as? NSDictionary
        
    }
}


