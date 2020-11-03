//
//  MyTableViewController.swift
//  URLsessionJSONRequest
//
//  Created by Corwin Hill on 11/2/20.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    // Demo Array how to populate the Table View contoller
    public var mobles: [String] = [
        "Ones",
        "Two",
        "Three",
        "four",
        "five",
        "Six"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") 
    }
    
    // How many Table Rows ??
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mobles.count // Count the array so we know how many rows to show.
    }
    
    // Build the Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // identifer
        cell.textLabel?.text = mobles[indexPath.row] // The Text for the cell
        return cell // call the cell
    }
   

}
