//
//  ViewController.swift
//  CustomCell
//
//  Created by James Hunt on 7/1/21.
//

import UIKit

class CustomCellsViewController: UITableViewController {
    var nums = [1, 90, 32, 23, 9, 12]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.rightLabel.text = "\(nums[indexPath.row])"
        
        if nums[indexPath.row] > 24 {
            cell.leftButton.backgroundColor = .green
        }else{
            cell.leftButton.backgroundColor = .red
        }
        
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }


}

