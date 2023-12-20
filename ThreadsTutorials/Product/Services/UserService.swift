//
//  UserService.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 15.12.2023.
//

import Firebase

protocol IUserService {
    var currentUser: UserModel? {get set}
    func fetchCurrentUser() async throws
    static func fetchUsers() async throws -> [UserModel]
    static func fetchUser(withUid uid: String) async throws -> UserModel
    func uploadUserData(currentUser: UserModel)async throws
    func reset()
}

class UserService: IUserService {
    @Published var currentUser: UserModel?

    static let shared = UserService()

    init() {
        Task {
            try await fetchCurrentUser()
        }
    }

    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let snapshot = try await Firestore.firestore().collection(Collections.users.rawValue).document(uid).getDocument()
        let user = try snapshot.data(as: UserModel.self)
        self.currentUser = user
    }

    static func fetchUsers() async throws -> [UserModel] {
        guard let currentUid = Auth.auth().currentUser?.uid else {return[]}
        let snapshot = try await Firestore.firestore().collection(Collections.users.rawValue).getDocuments()
        let users = try snapshot.documents.compactMap({try $0.data(as: UserModel.self)})
        return users.filter({$0.id != currentUid})
    }

    static func fetchUser(withUid uid: String) async throws -> UserModel {
        let snapshot = try await Firestore.firestore().collection(Collections.users.rawValue).document(uid).getDocument()
        return try snapshot.data(as: UserModel.self)
    }

    func reset() {
        self.currentUser = nil
    }

    func uploadUserData(currentUser: UserModel)async throws {
        self.currentUser = currentUser
    }

    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        try await Firestore.firestore().collection(Collections.users.rawValue).document(currentUid).updateData(["profileImageUrl": imageUrl])

        self.currentUser?.profileImageUrl = imageUrl
    }
}
