//
//  ViewController.swift
//  RainbowRoad
//
//  Created by James Hunt on 7/1/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let colors:[UIColor] = [.yellow,.red,.green,.blue,.orange,.systemPink,.purple,.cyan,.systemTeal]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }


}

extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = colors[indexPath.row]
        
        return cell
        
    }
}
