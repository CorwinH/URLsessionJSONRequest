//
//  MyTableViewController.swift
//  URLsessionJSONRequest
//
//  Created by Corwin Hill on 11/2/20.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mobles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = mobles[indexPath.row]
        return cell
    }
   

}
