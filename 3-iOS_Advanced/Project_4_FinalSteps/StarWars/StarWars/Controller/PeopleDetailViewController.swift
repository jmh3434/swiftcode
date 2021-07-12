//
//  PeopleDetailViewController.swift
//  StarWars
//
//  Created by James Hunt on 7/12/21.
//

import UIKit

class PeopleDetailViewController: UIViewController {
    
    var person:NSDictionary?
    
    var personDict = [String:String]()
    var speciesDict = [String:String]()

    @IBOutlet weak var personLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPersonInfo()
        getSpecies()
    }
    func updateLabel(){
        var labelString = String()
        for (key,value) in personDict {
            labelString.append("\(key): \(value)\n")
        }
        labelString.append("\nSpecies Info:\n")
        for (key,value) in speciesDict {
            labelString.append("\(key): \(value)\n")
        }
        personLabel.text = labelString
    }
    func getPersonInfo(){
        if let starWarsPerson = person {
            personDict["name"] = starWarsPerson["name"] as? String
            personDict["gender"] = starWarsPerson["gender"] as? String
            personDict["birth_year"] = starWarsPerson["birth_year"] as? String
            personDict["mass"] = starWarsPerson["mass"] as? String
            personDict["height"]  = starWarsPerson["species"] as? String
        }
        updateLabel()
    }
    func getSpecies(){
        guard let species = person!["species"] as? NSArray else {return}
        let specieString =  species[0] as! String
        StarWarsModel.getSpecies(urlString: specieString) { data, result, error in
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                
                if let speciesInfo = jsonResult as? NSDictionary {
                    self.speciesDict["name"] = speciesInfo["name"] as? String
                    self.speciesDict["classification"] = speciesInfo["classification"] as? String
                    self.speciesDict["average_lifespan"] = speciesInfo["average_lifespan"] as? String
                    self.speciesDict["homeworld"] = speciesInfo["homeworld"] as? String
                    self.speciesDict["language"] = speciesInfo["language"] as? String
                }
                DispatchQueue.main.async {
                    self.updateLabel()
                }
            }catch{
                print(error)
            }
        }
    }
    
}
