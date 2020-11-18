//
//  MyTableViewController.swift
//  URLsessionJSONRequest
//
//  Created by Corwin Hill on 11/2/20.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    // Demo Array how to populate the Table View contoller
    public var mobles: [String] = []
    private var loading = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        theapi()
        
        
    }
    
    // How many Table Rows ??
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        func test(n:NSNotification){
            
        }
        if loading{
            return 1
        } else{
            return mobles.count // Count the array so we know how many rows to show.
        }
        
        
        
       
        
    }
    
    // Build the Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // identifer
        
        if loading {
            cell.textLabel?.text = "...."
        } else{
            cell.textLabel?.text = mobles[indexPath.row] // The Text for the cell
        }
        return cell // call the cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // identifer
        //mobles[indexPath.row]
        print(mobles[indexPath.row])
        
        
        /// Calls the "View Contoler with ID as a popover.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sec = storyboard.instantiateViewController(identifier: "testview123")
        sec.modalPresentationStyle = .popover
        sec.modalTransitionStyle = .crossDissolve
        
        present(sec, animated: true, completion: nil)
        /// End Popover
        
    }
    
    private func theapi(){
        /**/
        
        // Calls the URL (API)
        guard  let url = URL(string: "https://all360solutions.com/api/workers") else{return}
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { [self] (data, response, error) in
            guard let data = data else { return }
                do{
                    /*let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)*/
                    
                    let users = try JSONDecoder().decode(UserResponse.self, from: data)
                    
                    //print(users)
                    mobles.removeAll()
                    var i = 0
                    
                    
                    // Parsing the Data within a For Each loop
                    users.users.forEach {
                        //print($0.first_name)
                        mobles.append($0.first_name) // append to numbers not working..
                        
                        //print(users.users.endIndex)
                        i = i+1
                        //print(i)
                        /*
                        if(users.users.endIndex == i){
                            //fox = 2
                            //print(fox)
                            // push here.. but how???
                            NotificationCenter.default.post(name: NSNotification.Name("CountMadeIt"), object: nil)
                            
                            print("xxx")
                            // adding our array to our Table View Controller
                            //vc.mobles = numbers
                            // Load the Table View Contoller page on load.
                            //self.navigationController?.pushViewController(vc, animated: true)
                            
                            
                        }*/
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    /*
                    for user in users{
                        print([user.users])
                    }
    */
                    
                    
                    //print("ID -> " + users.first_name)
                    
                    /* if array using decode([User].self,....)*/
    /*(
                    for user in users{
                        print(user.id)
                    }
    */
                    
                } catch{ print(error) } // Print error later push to logs
            
            self.loading = false
            // cant run in main?? Then use DispatchQueue.main.asyc then it will F! work.
            DispatchQueue.main.async {
                tableView.reloadData()
            }
            
            
            }
        
        
        //NotificationCenter.default.addObserver(self, selector: #selector(didcount(n:)), name: NSNotification.Name.init(rawValue: "DataDownloaded"), object: nil)
        
        
        task.resume() // reuse normal use
        
        
        /***/
    }
   

}
