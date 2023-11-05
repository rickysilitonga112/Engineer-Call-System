//
//  LoginViewModel.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 03/11/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    
    @MainActor
    func login() async throws {
        
    }
}
