//
//  User.swift
//  MovieMarks
//
//  Created by mathieu muty on 23/04/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID;
    var username: String
    var email: String
    var password: String
    var isLogin: Bool
    
    init(id: UUID = UUID(), username: String, email: String, password: String) {
        self.id = id
        self.username = username
        self.email = email
        self.password = password
        self.isLogin = false
    }
    
    init(id: UUID = UUID(), username: String, password: String) {
        self.id = id
        self.username = username
        self.email = ""
        self.password = password
        self.isLogin = false
    }
    
    mutating func login() {
        isLogin = true
    }
    
    mutating func logout() {
        isLogin = false
    }
}

extension User {
    static let sampleData: [User] = [
        User(username: "Toto", email: "toto@gmail.com", password: "tata"),
        User(username: "Mathieu", email: "mathieu@gmail.com", password: "tata")
    ]
}
