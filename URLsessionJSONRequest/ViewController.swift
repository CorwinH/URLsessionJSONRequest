//
//  ViewController.swift
//  URLsessionJSONRequest
//
//  Created by Corwin Hill on 10/23/20.
//

import UIKit




class ViewController: UIViewController {

    @IBAction func onGetTapped(_ sender: Any) {
        
        guard  let url = URL(string: "https://l3dev.com/api/user/312819076523281302") else{return}
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
                do{
                    /*let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)*/
                    
                    let users = try JSONDecoder().decode(User.self, from: data)
                    print("ID -> " + users.first_name)
                    
                    /* if array using decode([User].self,....)*/
 /*(
                    for user in users{
                        print(user.id)
                    }
    */
                    
                } catch{ print(error) }
            }
        task.resume()
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



