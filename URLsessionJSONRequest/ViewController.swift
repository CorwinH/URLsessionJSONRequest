//
//  ViewController.swift
//  URLsessionJSONRequest
//
//  Created by Corwin Hill on 10/23/20.
//

import UIKit




class ViewController: UIViewController {
    
    
    //var users = [UserResponse]()
    
    // The String we'll use to push everything to our Table view
    var numbers: [String] = ["ABC123", "i'm the best", "not really", "some more random text"]
    

    @IBAction func onGetTapped(_ sender: Any) {
        
        // Declaring the table View Controller for when we push our data to the next page.
        let vc = MyTableViewController()
        
        // Calls the URL (API)
        guard  let url = URL(string: "https://l3dev.com/api/workers") else{return}
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { [self] (data, response, error) in
            guard let data = data else { return }
                do{
                    /*let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)*/
                    
                    let users = try JSONDecoder().decode(UserResponse.self, from: data)
                    //print(users)
                    
                    
                    
                    // Parsing the Data within a For Each loop
                    users.users.forEach {
                        print($0.first_name)
                        self.numbers.append("33xxxxxxxxxxxxxxxxxx") // append to numbers not working..
                        numbers += ["3321"] // test
                        self.numbers += ["3321"] // test
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
            }
        task.resume() // reuse normal use
        
        // adding our array to our Table View Controller
        vc.mobles = numbers
        // Load the Table View Contoller page on load.
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    
    @IBAction func onPostTapped(_ sender: Any) {
        
        let parameters = ["email": "CorwinHill@L3git.com", "id": "312819076523281302"]
        //https://l3dev.com/api/login/312819076523281302 /// need to setup API for login POST, then it should create a "Key" that can be used to grab info
        //https://jsonplaceholder.typicode.com/posts
        
        guard  let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
        
        
    }
    

}


