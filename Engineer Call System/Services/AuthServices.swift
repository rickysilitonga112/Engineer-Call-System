//
//  AuthServices.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 01/11/23.
//

import Firebase
import FirebaseFirestoreSwift

class AuthServices {
    static let shared = AuthServices()
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        if let userSession = self.userSession {
            print("DEBUG: Current session id: \(userSession.uid)")
        } else {
            print("DEBUG: Current session is nil")
        }
    }
    
    @MainActor
    func createUser(email: String, fullName: String,username: String, password: String, role: Role) async throws {
        do {
            // register the user with email password
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
            // set the user session
            self.userSession = result.user
            
            // upload another user data to the firebase firestore
            try await uploadUserData(id: result.user.uid, email: email, fullName: fullName, username: username, role: role)
        } catch {
            print("DEBUG: Failed to create user with email password with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func singIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
        } catch {
            print("DEBUG: Failed to sing in the user with error: \(error)")
        }
    }
    
    
    func signOut() {
        // first sign out from firebase
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error while sign out from firebase with error \(error.localizedDescription)")
        }
        
        // set local user session is nil
        self.userSession = nil
        
        // set usersession in user service is nil
    }
    
    @MainActor
    private func uploadUserData(id: String, email: String, fullName: String, username: String, role: Role) async throws {
        
        let user = User(id: id, email: email, fullName: fullName, userName: username, role: role)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        
        try await Firestore.firestore().collection("user").document(id).setData(userData)

        // set user services
    }
    
    
}


