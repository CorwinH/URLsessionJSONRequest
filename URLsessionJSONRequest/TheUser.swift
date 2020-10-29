//
//  TheUser.swift
//  URLsessionJSONRequest
//
//  Created by Corwin Hill on 10/28/20.
//

import Foundation

struct User: Decodable {
    let id: String
    let first_name: String
    let last_name: String
    let email: String
    let last_login: String
    let user_type: String
    let created_date: String
    //let user_auth: [String: String]
}
