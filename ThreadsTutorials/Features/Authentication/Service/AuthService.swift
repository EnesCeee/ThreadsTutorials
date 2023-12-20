//
//  AuthService.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 14.12.2023.
//

import Firebase
import FirebaseFirestoreSwift

protocol IAuthService {
    var userSession: FirebaseAuth.User? { get set }
    func login(withEmail email: String, password: String) async throws
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws
    func signOut()
}

class AuthService: IAuthService {

    @Published var userSession: FirebaseAuth.User?

    static let shared = AuthService()

    init() {
        self.userSession = Auth.auth().currentUser

    }

    @MainActor
    func login(withEmail: String, password: String) async throws {

        do {
            let result = try await Auth.auth().signIn(withEmail: withEmail, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()

        } catch {
            print("DEBUG: Failed to login user with error \(error.localizedDescription)")

        }

    }

    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result =  try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(id: result.user.uid, withEmail: email, fullname: fullname, username: username)

        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }

    func signOut() {
       try? Auth.auth().signOut() // signs out on backend
        self.userSession = nil // this removes session locally and updates routing
        UserService.shared.reset() // sets current user object to nil
    }

    @MainActor
    private func uploadUserData( id: String, withEmail email: String, fullname: String, username: String) async throws {

        let user = UserModel(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection(Collections.users.rawValue).document(id).setData(userData)
        UserService.shared.currentUser = user
    }

}
