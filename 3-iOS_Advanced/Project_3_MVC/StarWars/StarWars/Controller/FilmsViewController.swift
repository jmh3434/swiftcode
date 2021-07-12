//
//  FilmsViewController.swift
//  StarWars
//
//  Created by James Hunt on 7/11/21.
//

import UIKit

class FilmsViewController: UITableViewController {
    
    var films = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllFilms {
            data, result, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    
                    if let results = jsonResult["results"] {
                        
                        let resultsArray = results as! NSArray
                        for result in resultsArray {
                            let dict = result as! NSDictionary
                            if let name = dict["title"] {
                                self.films.append(name as! String)
                            }
                        }
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
        return films.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = films[indexPath.row]
        
        return cell!
        
    }
}


