//
//  ViewController.swift
//  AgingPeople
//
//  Created by James Hunt on 7/1/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let people = ["James","Issac","Rebekah","Billy","Myra","Tucker","Michael","Lee","David","Lucy"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
    }


}

extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let randomAge = Int.random(in: 5...99)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = people[indexPath.row]
        
        cell.detailTextLabel?.text = "\(randomAge)"
        
        

        
        return cell
    }
    
}

