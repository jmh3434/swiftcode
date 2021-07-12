//
//  PeopleViewController.swift
//  StarWars
//
//  Created by James Hunt on 7/9/21.
//

import UIKit

class PeopleViewController: UITableViewController {

    
    var resultArray = NSArray()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            StarWarsModel.getAllPeople(completionHandler: {
                data, response, error in
                    do {
                  
                        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                            if let results = jsonResult["results"] as? NSArray {
                                self.resultArray = results
                            }
                        }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("Something went wrong")
                    }
            })
        }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell()
    
        if let result = resultArray[indexPath.row] as? NSDictionary {
            cell.textLabel?.text = result["name"] as? String
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "peopleDetail", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = sender as! NSIndexPath
        
        let vc = segue.destination as! PeopleDetailViewController
        
        vc.person = resultArray[indexPath.row] as? NSDictionary
        
    }
}

