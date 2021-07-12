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
            // specify the url that we will be sending the GET request to
            let url = URL(string: "https://swapi.dev/api/films/?format=json")
            // create a URLSession to handle the request tasks
            let session = URLSession.shared
            // create a "data task" to make the request and run completion handler
            let task = session.dataTask(with: url!, completionHandler: {
                // see: Swift closure expression syntax
                data, response, error in
                // data -> JSON data, response -> headers and other meta-information, error-> if one occurred
                // "do-try-catch" blocks execute a try statement and then use the catch statement for errors
                do {
                    // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        // Why do we need to optionally unwrap jsonResult["results"]
                        // Try it without the optional unwrapping and you'll see that the value is actually an optional
                        if let results = jsonResult["results"] {
                        // coercing the results object as an NSArray and then storing that in resultsArray
                            let resultsArray = results as! NSArray
                            // now we can run NSArray methods like count and firstObject
                            print(resultsArray.count); print(resultsArray[0])
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
            })
            // execute the task and then wait for the response
            // to run the completion handler. This is async!
            task.resume()
        
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

   
