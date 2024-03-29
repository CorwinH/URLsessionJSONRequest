//
//  ViewController.swift
//  URLsessionJSONRequest
//
//  Created by Corwin Hill on 10/23/20.
//

import UIKit
import AudioToolbox


class ViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    //var users = [UserResponse]()
    
    // The String we'll use to push everything to our Table view
    var numbers: [String] = ["ABC123"]
    var fox = 0
    
/*
    

    @IBAction func onGetTapped(_ sender: Any) {
        
        // Declaring the table View Controller for when we push our data to the next page.
        let vc = MyTableViewController()
        //var psuhit = 0
        
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
                    numbers.removeAll()
                    var i = 0
                    
                    
                    // Parsing the Data within a For Each loop
                    users.users.forEach {
                        print($0.first_name)
                        self.numbers.append($0.first_name) // append to numbers not working..
                        //print(users.users.endIndex)
                        i = i+1
                        //print(i)
                        if(users.users.endIndex == i){
                            fox = 2
                            print(fox)
                            // push here.. but how???
                            //NotificationCenter.default.post(name: NSNotification.Name("CountMadeIt"), object: nil)
                            
                            print("xxx")
                            // adding our array to our Table View Controller
                            vc.mobles = numbers
                            // Load the Table View Contoller page on load.
                            self.navigationController?.pushViewController(vc, animated: true)
                            
                            
                        }
                        
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
        
        
        //NotificationCenter.default.addObserver(self, selector: #selector(didcount(n:)), name: NSNotification.Name.init(rawValue: "DataDownloaded"), object: nil)
        
        
        

        
        
        
        task.resume() // reuse normal use
        
        
        
        
        
        func didcount(n:NSNotification){
                
                
                
            }
        
        
        
        
        
    }
    */
    
    
    @IBAction func onPostTapped(_ sender: Any) {
        
        let The_Email_Text: String = txtEmail.text!
        let The_Pass_Text: String = txtPass.text!
        
        let parameters = ["pa": The_Pass_Text, "em": The_Email_Text] // change this to grab the text box texts.
        // before we pass the paramters we need to encrip the password sha512
        
        guard  let url = URL(string: "https://all360solutions.com/api/p_login/") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        else { return }
        
        request.httpBody = httpBody
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                //print(response)
            }
            
            if let response_server = response as? HTTPURLResponse{ // acts as a try catch on the nil error
                if(response_server.statusCode == 202){
                    DispatchQueue.main.async {
                    self.navigationController?.pushViewController(MyTableViewController(), animated: true)
                    }
                }
            }
            
            //print(response_server.statusCode)
            
            
            else{
                print("Login Failed")
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    //print(json)
                } catch {
                    //print(error)
                }
            }
        }.resume()
       
    }
    
    
    

}


