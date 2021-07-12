//
//  FilmDetailViewController.swift
//  StarWars
//
//  Created by James Hunt on 7/12/21.
//

import UIKit

class FilmDetailViewController: UIViewController {
    
    var film:NSDictionary?
    var filmDict = [String:String]()
    
    @IBOutlet weak var filmLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFilmInfo()
    }
    func updateLabel(){
        var labelString = String()
        for (key,value) in filmDict {
            labelString.append("\(key): \(value)\n")
        }
       
        filmLabel.text = labelString
    }
    func getFilmInfo(){
        if let swFilm = film {
            filmDict["title"] = swFilm["title"] as? String
            filmDict["director"] = swFilm["director"] as? String
            filmDict["release_date"] = swFilm["release_date"] as? String
            filmDict["opening_crawl"] = swFilm["opening_crawl"] as? String
   
        }
        updateLabel()
    }
}
