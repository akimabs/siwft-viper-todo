//
//  Login.Entity.swift
//  cobaviper
//
//  Created by Abdul Hakim on 15/10/23.
//

import Foundation

struct LoginPayload: Encodable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
    let token: String
}

struct DataUser: Codable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
}
