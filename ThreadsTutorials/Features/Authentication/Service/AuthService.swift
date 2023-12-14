//
//  AuthService.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 14.12.2023.
//

import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }

    func login(withEmail: String, password: String) async throws {
        
    }
    
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        
        do {
            try await Auth.auth().createUser(withEmail: email, password: password)
        } catch {
            
        }
    }
    
}
