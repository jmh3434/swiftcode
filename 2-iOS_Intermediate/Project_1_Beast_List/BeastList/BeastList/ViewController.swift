//
//  ViewController.swift
//  BeastList
//
//  Created by James Hunt on 7/1/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // Create this array at the top of your class as a property
    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func beastButtonPressed(_ sender: UIButton) {
        if let text = taskTextField.text {
            tasks.append(text)
        }
        tableView.reloadData()
    }
    
}


extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
   
}


