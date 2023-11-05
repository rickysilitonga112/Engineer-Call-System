//
//  RegistrationViewModel.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 01/11/23.
//

import Firebase

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var fullName = ""
    @Published var username = ""
    @Published var role = Role.defaultRole
    @Published var password = ""
    @Published var confirmPassword = ""
    
    @MainActor
    func registerUser() async throws {
        if password == confirmPassword {
            try await AuthServices.shared.createUser(email: email, fullName: fullName, username: username, password: password, role: role)
        } else {
            print("DEBUG: Password is not match")
            return
        }
    }
}
