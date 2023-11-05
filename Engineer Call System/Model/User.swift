//
//  User.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 01/11/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    var id: String
    let email: String
    var fullName: String
    var userName: String
    var role: Role
    var profileImageUrl: String?
}
